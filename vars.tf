variable "amis" {
  type = "map"
  default = {
    "virginia" = "ami-55ef662f"
    "europe" = "ami-bf2ba8d0"
    "brasil" = "ami-286f2a44"
    description = "This variable contains that will be used in each region (Virginia, Frankfurt, and Sao Paulo)."
  }
}

variable "credentials_file" {
  type = "string"
  description = "This variable contains the path to the file with the AWS API credentials."
  default = "/vagrant/credentials"
}
