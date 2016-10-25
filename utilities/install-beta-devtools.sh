#!/bin/sh

echo ""
if [[ ! -d "${HOME}/wpilib" ]]; then
	echo "Uninstalling WPILib libraries ..."
	rm -rf ~/wpilib

    echo "Uninstalling released WPILib plugins from Eclipse ..."
    eclipse -application org.eclipse.equinox.p2.director -repository http://first.wpi.edu/FRC/roborio/release/eclipse/ -uninstallIU edu.wpi.first.wpilib.plugins.java.feature.feature.group
    echo ""
fi

echo "Installing 2017 Beta WPILib plugins into Eclipse ..."
eclipse -application org.eclipse.equinox.p2.director -repository http://first.wpi.edu/FRC/roborio/beta/eclipse/ -installIU edu.wpi.first.wpilib.plugins.java.feature.feature.group

echo ""
echo "Installing Strongback 1.1.8 ..."
install-strongback.sh 1.1.8

# We want to copy the Strongback JARs into the correct WPILib directory ...
mkdir -p ~/wpilib/user/java/lib/
cp ~/strongback/java/lib/*.jar ~/wpilib/user/java/lib/
if [[ ! -d "${HOME}/strongback/user/java/lib" ]]; then
	# Also copy the user libraries that Strongback includes ...
    cp ~/strongback/user/java/lib/*.jar ~/wpilib/user/java/lib/
fi
# Don't copy the test-related artifacts just yet. We're hoping that WPILib will soon add support for test-related JARs.

add-github-repo.sh 2017-Beta