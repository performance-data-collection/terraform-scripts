# US East (N. Virginia)
provider "aws" {
  version = "~> 1.5"
  shared_credentials_file = "/vagrant/credentials"
  region = "us-east-1"
  alias = "virginia"
}

# EU (Frankfurt)
provider "aws" {
  version = "~> 1.5"
  shared_credentials_file = "/vagrant/credentials"
  region = "eu-central-1"
  alias = "europe"
}

# South America (Sao Paulo)
provider "aws" {
  version = "~> 1.5"
  shared_credentials_file = "${var.credentials_file}"
  region = "sa-east-1"
  alias = "brasil"
}

module "virginia_instance" {
  source = "./aws_instance_located"
  region_ami = "${var.amis["virginia"]}"

  providers = {
    "aws" = "aws.virginia"
  }
}

module "europe_instance" {
  source = "./aws_instance_located"
  region_ami = "${var.amis["europe"]}"

  providers = {
    "aws" = "aws.europe"
  }
}

module "brasil_instance" {
  source = "./aws_instance_located"
  region_ami = "${lookup(var.amis, "brasil")}"

  providers = {
    "aws" = "aws.brasil"
  }
}
