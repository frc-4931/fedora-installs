#!/bin/sh

#
# Try to install/update the FRC4931 utilities
#
~/fedora-installs/utilities/update-utilities.sh

eclipse_plugin_url="http://first.wpi.edu/FRC/roborio/release/eclipse/"

if [[ -d "${HOME}/wpilib" ]]; then
    echo ""
	echo "Uninstalling WPILib libraries ..."
	rm -rf ~/wpilib
fi

echo ""
echo "Uninstalling WPILib plugins from Eclipse ..."
eclipse -application org.eclipse.equinox.p2.director -repository ${eclipse_plugin_url} -uninstallIU edu.wpi.first.wpilib.plugins.java.feature.feature.group > /dev/null
#
# Install latest WPILib
#
echo "Installing latest WPILib plugins into Eclipse"
eclipse -application org.eclipse.equinox.p2.director -repository ${eclipse_plugin_url} -installIU edu.wpi.first.wpilib.plugins.java.feature.feature.group
if [[ ! -d "${HOME}/wpilib" ]]; then
    echo ""
	echo "Open Eclipse and create new robot project to complete installatin of WPILib libraries."
    echo ""
fi

#
# Install latest Strongback
#
~/fedora-installs/utilities/strongback install
