#!/bin/sh

#
# Try to install/update the FRC4931 utilities
#
./fedora-installs/utilities/update-utilities.sh

#
# Install WPILib (or Beta)
#
echo "Installing WPILib plugins into Eclipse"
eclipse -application org.eclipse.equinox.p2.director -repository http://first.wpi.edu/FRC/roborio/release/eclipse/ -installIU edu.wpi.first.wpilib.plugins.java.feature.feature.group

#
# Install Strongback
#
./fedora-installs/utilities/install-strongback.sh 1.1.7
