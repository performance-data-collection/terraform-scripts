variable "amis" {
  type = "map"
  default = {
    "virginia" = "ami-f6e6948c"
    "europe" = "ami-351c965a"
    "brasil" = "ami-a61c5dca"
    description = "This variable contains that will be used in each region (Virginia, Frankfurt, and Sao Paulo)."
  }
}

variable "credentials_file" {
  type = "string"
  description = "This variable contains the path to the file with the AWS API credentials."
  default = "/vagrant/credentials"
}
