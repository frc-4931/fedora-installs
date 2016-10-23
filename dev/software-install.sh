#!/bin/sh

#
# Read the name of the computer user that will be created
read -p "Enter name of the account : " username

#
# Update the system
#
echo ""
echo "Updating the system"
dnf -y update

#
# Install Git, Java Development Kit (OpenJDK 8), Eclipse, and Eclipse packages
#
echo "Installing Git, OpenJDK 8, and Eclipse"
dnf -y install git java-1.8.0-openjdk-devel eclipse eclipse-jdt eclipse-mpc eclipse-egit eclipse-egit-github

#
# Define yum repository for Chrome
#
cat > /etc/yum.repos.d/google-chrome.repo << EOF
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

#
# And install Chrome
#
echo "Installing Chrome"
dnf install google-chrome-stable

#
# Download and install Slack
#
echo "Installing Slack"
dnf -y install libappindicator
rpm -ivh https://downloads.slack-edge.com/linux_releases/slack-2.2.1-0.1.fc21.x86_64.rpm

#
# Clean any cached/downloaded dnf files ...
#
echo "Cleaning cached/downloaded files"
dnf clean packages

#
# Install WPILib (or Beta)
#
echo "Installing WPILib plugins into Eclipse"
eclipse -application org.eclipse.equinox.p2.director -repository http://first.wpi.edu/FRC/roborio/release/eclipse/ -installIU edu.wpi.first.wpilib.plugins.java.feature.feature.group

#
# Create user with the standard "robot" password
#
echo ""
echo "Creating \"${username}\" account"
useradd -m -p paN9VBbt7rQbw $username
[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"

mkdir /home/$username/bin

#
# Install Strongback
#
strongback_version=1.1.7
echo ""
echo "Installing Strongback ${strongback_version}"
curl -OL https://github.com/strongback/strongback-java/releases/download/v${strongback_version}/strongback-${strongback_version}.zip
unzip strongback-${strongback_version}.zip -d /home/$username/
rm strongback-${strongback_version}.zip
chown -R $username /home/$username/strongback
echo "STRONGBACK_HOME=/home/$username/strongback" >> /home/$username/.bashrc
echo "PATH=\$\{STRONGBACK_HOME\}/java/bin:\$\{PATH\}" >> /home/$username/.bashrc

#
# We're done!
#
echo ""
echo "FRC4931 Fedora software installation complete."
echo ""
echo "Next, the user should log into \"${username}\" and run `config-github.sh` command."
