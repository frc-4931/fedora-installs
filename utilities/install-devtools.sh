#!/bin/sh

if [[ ! -d "~/fedora-installs" ]]; then
    cd ~
    git clone https://github.com/frc-4931/fedora-installs.git
    echo "PATH=\${HOME}/fedora-installs/utilities/:\${PATH}" >> /home/$username/.bashrc
fi

#
# Install WPILib (or Beta)
#
echo "Installing WPILib plugins into Eclipse"
eclipse -application org.eclipse.equinox.p2.director -repository http://first.wpi.edu/FRC/roborio/release/eclipse/ -installIU edu.wpi.first.wpilib.plugins.java.feature.feature.group

#
# Install Strongback
#
install-strongback.sh 1.1.7

#
# Configure Git and GitHub
#config-github.sh

#
# Set up the Eclipse workspace
#
#add-github-repo.sh 2016-Robot
