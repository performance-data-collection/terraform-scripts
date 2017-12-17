provider "aws" {
}

variable "region_ami" {}

resource "aws_instance" "gnu_linux" {
  provider = "aws"
  ami           = "${var.region_ami}"
  instance_type = "t2.micro"
}
