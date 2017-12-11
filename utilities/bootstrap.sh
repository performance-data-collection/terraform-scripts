#!/bin/bash
# https://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory
echo "Adding /etc/apt/apt.conf.d/99disable-recommends."
echo '
APT::Install-Suggests "0";
APT::Install-Recommends "0";
' > /etc/apt/apt.conf.d/99disable-recommends
# No package preconfiguration required
rm -fv /etc/apt/apt.conf.d/70debconf
# No listchanges call before installing
rm -fv /etc/apt/apt.conf.d/20listchanges
apt-get update
# Less verbose output: https://askubuntu.com/questions/258219/how-do-i-make-apt-get-install-less-noisy
apt-get install -q -o=Dpkg::Use-Pty=0 --assume-yes curl unzip jq emacs-nox
