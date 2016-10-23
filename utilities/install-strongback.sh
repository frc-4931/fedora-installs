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
if [[ ! -d "~/strongback" ]] || [[ $(strongback.sh version) != "${version}" ]]; then
  echo ""
  echo "Installing or upgrading Strongback ${version}"
  echo ""
  oldDir=$(pwd)
  cd ~/
  rm -rf strongback
  curl -OL https://github.com/strongback/strongback-java/releases/download/v${version}/strongback-${version}.zip
  unzip strongback-${version}.zip -d ~/
  rm strongback-${version}.zip
  cd $oldDir
fi

if [[ -z $(grep "STRONGBACK_HOME=" ~/.bashrc) ]]; then
  echo "STRONGBACK_HOME=\${HOME}/strongback" >> ~/.bashrc
  echo "PATH=\${STRONGBACK_HOME}/java/bin:\${PATH}" >> ~/.bashrc
fi
