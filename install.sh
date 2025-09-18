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
