#!/bin/sh

#
# Read the name of the computer user that will be created
version=$1
if [[ -z "$version" ]]; then
    read -p "  Enter Strongback version : " version
fi

#
# Install Strongback
#
if [[ ! -d "/home/$username/strongback" -o $(strongback.sh --version) != "${version}" ]]; then
  echo ""
  echo "Installing or upgrading Strongback ${version}"
  echo ""
  rm -rf /home/$username/strongback
  curl -OL https://github.com/strongback/strongback-java/releases/download/v${version}/strongback-${version}.zip
  unzip strongback-${version}.zip -d /home/$username/
  rm strongback-${version}.zip
  chown -R $username /home/$username/strongback
fi

if [[ -z $(grep "STRONGBACK_HOME=" /home/$username/.bashrc) ]]; then
  echo "STRONGBACK_HOME=/home/$username/strongback" >> /home/$username/.bashrc
  echo "PATH=\$\{STRONGBACK_HOME\}/java/bin:\$\{PATH\}" >> /home/$username/.bashrc
fi
