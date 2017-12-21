variable "region_ami" {
  type = "string"
  description = "The AWS AMI to use for the instance."
}

variable "instance_type" {
  type = "string"
  description = "The type of instance to start."
  default = "t2.micro"
}

variable "key_name" {
  type = "string"
  description = "The key name to use for the instance."
  default = "terraform-key"
}

variable "key_file_path" {
  type = "string"
  description = "The path to the public key file to use for ssh access."
  default = "default.pem.pub"
}

variable "priv_key_file_path" {
  type = "string"
  description = "The path to the private key file to use for ssh access."
  default = "default.pem"
}

variable "inbound_cidr_blocks" {
  type = "list"
  description = "List of CIDR blocks."
  default = ["0.0.0.0/0"]
}
