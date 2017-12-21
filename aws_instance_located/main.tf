provider "aws" {
}

resource "aws_key_pair" "default" {
  provider = "aws"
  key_name   = "${var.key_name}"
  public_key = "${file("${var.key_file_path}")}"
}

resource "aws_instance" "gnu_linux" {
  provider = "aws"
  ami           = "${var.region_ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.allow_all_output.name}", "${aws_security_group.allow_ssh.name}"]

  connection {
    user = "admin"
    private_key = "${file("${var.priv_key_file_path}")}"
  }

  provisioner "local-exec" {
    command = "chmod 0600 '${var.priv_key_file_path}'"
  }

  provisioner "remote-exec" {
    script = "utilities/wait-until-boot-finished.sh"
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u admin --private-key '${var.priv_key_file_path}' -i '${self.public_ip},' ./ansible/master.yml"
  }
}

resource "aws_security_group" "allow_ssh" {
  provider = "aws"
  name = "allow_to_ssh"
  description = "Allow inbound SSH traffic."
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "${var.inbound_cidr_blocks}"
  }
}

resource "aws_security_group" "allow_all_output" {
  provider = "aws"
  name = "allow_all_output"
  description = "Allow all output traffic."
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
