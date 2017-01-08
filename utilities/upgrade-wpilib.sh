#!/bin/sh

#eclipse_plugin_url="http://first.wpi.edu/FRC/roborio/beta/eclipse/"
eclipse_plugin_url="http://first.wpi.edu/FRC/roborio/release/eclipse/"

echo ""
if [[ -d "${HOME}/wpilib" ]]; then
	echo "Uninstalling WPILib libraries ..."
#	rm -rf ~/wpilib

    echo "Uninstalling released WPILib plugins from Eclipse ..."
    eclipse -application org.eclipse.equinox.p2.director -repository ${eclipse_plugin_url} -uninstallIU edu.wpi.first.wpilib.plugins.java.feature.feature.group > /dev/null
    echo ""
fi

echo "Installing 2017 Beta WPILib plugins into Eclipse ..."
eclipse -application org.eclipse.equinox.p2.director -repository ${eclipse_plugin_url} -installIU edu.wpi.first.wpilib.plugins.java.feature.feature.group > /dev/null
