#!/bin/sh

#
# Update the system
#
echo ""
echo "Updating the system"
dnf -y update

#
# Install tools
#
echo "Installing Github CLI, and other software"
dnf -y install gh 

#
# Install WPILib
#

#
# Install Pathplanner
#

#
# Clean any cached/downloaded dnf files ...
#
echo "Cleaning cached/downloaded files"
dnf clean packages

#
# We're done!
#
echo ""
echo "FRC4931 Fedora software installation complete."
echo ""
#echo "Next, the users should log into their accounts and run \"install-devtools.sh\" command."
