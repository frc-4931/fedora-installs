#!/bin/sh

allUsernames=()
echo ""
read -p "Add a user? (y/n) " addUser
# Convert to lowercase and compare answer ...
while [[ ${addUser,,} == "y" ]]; do
    echo ""
    read -p "Enter the username : " username
    if [[ -n ${username} ]]; then
		#
		# Create user with the standard "robot" password
		#
        read -p "Enter the user's full name : " fullName
        if [[ -n ${fullName} ]]; then
		    useradd -m -c "${fullName}" $username
		else
			useradd -m ${username}
		fi
        if [[ $? -eq 0 ]]; then
			passwd $username
            while [[ $? -ne 0 ]]; do
                # Must have been an error setting the password, so try again
                passwd $username
            done
            read -p "Add as an administrator? (y/n) " isAdmin
            if [[ $isAdmin == "y" ]]; then
                usermod $username -a -G wheel
                echo "User \"${username}\" has been added to system as an administrator!"
            else
                echo "User \"${username}\" has been added to system!"
            fi
            allUsernames+=($username)
		else
			echo "Failed to add a user!"
		fi
	else
		echo "No username was given."
    fi
    echo ""
    read -p "Add another user? (y/n) " addUser
done

#
# Install the FRC4931 scripts for this user ...
#
if ! grep -q "fedora-installs" ${HOME}/.bashrc ; then
    echo "PATH=\${HOME}/fedora-installs/utilities/:\${PATH}" >> ~/.bashrc
    source ~/.bashrc
fi

#
# Install the FRC4931 scripts for each new user ...
#
for username in "${allUsernames[@]}"; do
    echo ""
    echo "Installing FRC4931 utilities into /home/$username"
    cd /home/$username
    git clone https://github.com/frc-4931/fedora-installs.git
    chown -R $username /home/$username/fedora-installs
    echo "PATH=\${HOME}/fedora-installs/utilities/:\${PATH}" >> /home/$username/.bashrc
done

#
# Update the system
#
echo ""
echo "Updating the system"
dnf -y update

#
# Install Git, Java Development Kit (OpenJDK 8), Eclipse, Eclipse packages, 
# Inconsolata open source monospace font, Fritzing (electrical CAD), Arduino programming environment
#
echo "Installing Git, OpenJDK 8, Eclipse, Inconsolata, Fritzing, Arduino, and other software"
dnf -y install git java-1.8.0-openjdk-devel-debug java-1.8.0-openjdk-src-debug eclipse eclipse-jdt eclipse-mpc eclipse-egit eclipse-egit-github levien-inconsolata-fonts fritzing arduino

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
dnf -y install google-chrome-stable

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
# We're done!
#
echo ""
echo "FRC4931 Fedora software installation complete."
echo ""
echo "Next, the users should log into their accounts and run \"install-devtools.sh\" command."
