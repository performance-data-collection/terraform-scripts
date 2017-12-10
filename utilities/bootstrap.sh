#!/bin/bash

# https://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory
echo "No package preconfiguration required:"
rm -v /etc/apt/apt.conf.d/70debconf
apt-get update
apt-get install --assume-yes curl unzip jq
