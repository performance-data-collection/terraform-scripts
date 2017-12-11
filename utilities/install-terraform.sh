#!/usr/bin/env bash
# Source: https://gist.githubusercontent.com/Adron/90863e51c8c5c0ad2049890bcd8abbfb/raw/100e153041336d31a10eb0b8c5327aaf4620fb12/install-terraform-packer-os-x.sh
#         https://www.pelo.tech/blog/install-terraform-packer
# Script prerequisite > install jq > https://stedolan.github.io

# Prerequisites
# sudo apt-get install --assume-yes jq
echo "Get URLs for most recent versions from https://releases.hashicorp.com/index.json"
terraform_url=$(curl -s  https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
# Remove previous version
rm -rvf ~/terraform-old
if [ -d ~/terraform ]; then
    echo "Moving previous directory ~/terraform to terraform-old"
    mv -v ~/terraform ~/terraform-old
fi
# mkdir terraform
mkdir -p ~/terraform
# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading $terraform_url."
curl -s -o ~/terraform/terraform.zip $terraform_url
# Unzip and install
unzip ~/terraform/terraform.zip -d ~/terraform/
# Delete previous version if present
rm -rvf ~/terraform-old
# If terraform path is not configured
if ! grep -s -H '~/terraform' ~/.bashrc; then
    echo "Adding terraform binary path to ~/.bashrc"
    echo '
# Terraform Path.
export PATH=~/terraform/:$PATH
' >>~/.bashrc
else
    echo "The Terraform path is already present in the .bashrc file."
fi
~/terraform/terraform version
