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
