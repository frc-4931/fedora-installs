#!/bin/sh

#
# Read the name of the computer user that will be created
version=$1
if [[ -z "$version" ]]; then
    read -p "  Enter Strongback version : " version
fi

#
# Strongback 1.1.x uses utilities, so make sure they are on the path ...
#
if [[ -z $(grep "STRONGBACK_HOME=" ~/.bashrc) ]]; then
  echo ""
  echo "Making Strongback utilities available in new terminals."
  echo ""
  echo "STRONGBACK_HOME=\${HOME}/strongback" >> ~/.bashrc
  echo "PATH=\${STRONGBACK_HOME}/java/bin:\${PATH}" >> ~/.bashrc
fi

#
# Install Strongback
#
source ~/.bashrc
if [[ ! -d "${HOME}/strongback" ]] || [[ $(strongback.sh version) != "${version}" ]]; then
  echo ""
  echo "Installing or upgrading Strongback ${version}"
  oldDir=$(pwd)
  cd ~/
  rm -rf strongback
  curl -OL https://github.com/strongback/strongback-java/releases/download/v${version}/strongback-${version}.zip
  unzip strongback-${version}.zip -d ~/
  rm strongback-${version}.zip
  cd $oldDir
else
  echo ""
  echo "Strongback ${version} is already installed."
  echo ""
fi

if [[ $(strongback.sh version) == "1."* ]]; then

  #
  # Strongback 1.1.x requires an Eclipse User Library, so make sure that the User Library import file exists ...
  #
  if [[ ! -d "${HOME}/strongback/java/eclipse" ]]; then
    #
    # It doesn't exist, but we can generate it by creating a bogus robot project for Eclipse
    #
    echo ""
    echo "Generating importable Strongback user library for Eclipse at \"${HOME}/strongback/java/eclipse\"."
    echo "Import this Eclipse User Library in each new Eclipse workspace."
    echo ""
    oldDir=$(pwd)
    tempDir="${HOME}/tmp-install-strongback-tmp-dir"
    mkdir -p $tempDir
    cd $tempDir
    if [[ ! -d "${HOME}/wpilib" ]]; then
        # Make it seem like the WPILib is installed
        mkdir -p ${HOME}/wpilib/current/java
        touch ${HOME}/wpilib/wpilib.properties
        strongback.sh new-project -e -o -p org.frc4931.robot -r foo
        rm -rf ${HOME}/wpilib
    else
        strongback.sh new-project -e -o -p org.frc4931.robot -r foo
    fi
    cd $oldDir
    rm -rf $tempDir
  fi
fi
