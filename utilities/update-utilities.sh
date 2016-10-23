#!/bin/sh

#
# Install/upgrade the FRC4931 scripts
#
echo ""
echo "Installing or upgading FRC4931 user utilities"
oldDir=$(pwd)
cd ~/fedora-installs
git pull
cd $oldDir
echo ""
