#!/bin/sh

# This script requires sudo privileges

#
# Install the required libraries
#
sudo dnf -y install gcc-c++ qt-devel libusb-devel
if [[ $? -ne 0 ]]; then
  echo "Failed to install libraries required by PixyMon!"
  exit 1
fi


#
# Save the current working directory 
#
CURRENT_DIR=$(pwd)

#
# Get the PixyMon source code
#
BUILD_DIR=/tmp/pixymon-build-fedora
mkdir -p ${BUILD_DIR}
rm -rf ${BUILD_DIR}/*
cd ${BUILD_DIR}
git clone https://github.com/charmedlabs/pixy.git pixy

# Build (must be in the scripts directory)
cd pixy/scripts
./build_pixymon_src.sh
if [[ $? -eq 0 ]]; then
  # The build was successful, so copy the binary ...
  sudo cp ${BUILD_DIR}/pixy/build/pixymon/bin/PixyMon /usr/bin
  sudo chmod 755 /usr/bin/PixyMon

  # Add the USB rules so that PixyMon can see the Pixy USB device
  if [[ -f "/etc/udev/rules/pixy.rules" ]]; then
    sudo rm /etc/udev/rules.d/pixy.rules
  fi
  sudo cp ${BUILD_DIR}/pixy/src/host/linux/pixy.rules /etc/udev/rules.d/
else
  echo "Failed to build PixyMon!"
  exit 2
fi

#
# Add the desktop shortcut ...
#
sudo mkdir -p /usr/local/share/icons
sudo cp ~/fedora-installs/pixymon/pixymon.desktop /usr/local/share/applications/
sudo cp ~/fedora-installs/pixymon/pixymon.png /usr/local/share/icons
sudo chmod 444 /usr/local/share/applications/pixymon.desktop
sudo chmod 444 /usr/local/share/icons/pixymon.png


cd $CURRENT_DIR
rm -rf ${BUILD_DIR}

echo ""
echo "PixyMon installed or updated. Look for PixyMon in Activities."
echo ""
