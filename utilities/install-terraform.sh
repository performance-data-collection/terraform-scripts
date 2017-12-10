#!/usr/bin/env bash
# Source: https://gist.githubusercontent.com/Adron/90863e51c8c5c0ad2049890bcd8abbfb/raw/100e153041336d31a10eb0b8c5327aaf4620fb12/install-terraform-packer-os-x.sh
#         https://www.pelo.tech/blog/install-terraform-packer
# Script prerequisite > install jq > https://stedolan.github.io

cd ~

# # Prerequisites
# if [ "$(uname)" == "Darwin" ]; then
#     brew install jq
# # For Linux
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#     sudo apt-get install --assume-yes jq
# fi

echo "Get URLs for most recent versions from https://releases.hashicorp.com/index.json"
# For OS-X
if [ "$(uname)" == "Darwin" ]; then
    terraform_url=$(curl -s  https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "darwin.*64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
    packer_url=$(curl -s  https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "darwin.*64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
# For Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    terraform_url=$(curl -s  https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
    # packer_url=$(curl -s  https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
fi

# Create a move into directory.
cd
# mkdir packer
mkdir -p terraform && cd $_

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading $terraform_url."
curl -s -o terraform.zip $terraform_url
# Unzip and install
unzip terraform.zip

# Change directory to Packer
# cd ~/packer

# # Download Packer. URI: https://www.packer.io/downloads.html
# echo "Downloading $packer_url."
# curl -s  -o packer.zip $packer_url
# # Unzip and install
# unzip packer.zip

if [ "$(uname)" == "Darwin" ]; then
  echo '
  # Terraform & Packer Paths.
  export PATH=~/terraform/:~/packer/:$PATH
  ' >>~/.bash_profile

  source ~/.bash_profile
# For Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo '
# Terraform & Packer Paths.
# export PATH=~/terraform/:~/packer/:$PATH
export PATH=~/terraform/:$PATH
  ' >>~/.bashrc

  # source ~/.bashrc
fi
~/terraform/terraform version
