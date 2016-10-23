#!/bin/sh

#
# Read the name of the computer user that will be created
echo ""
echo "Setting up GitHub access"
echo ""
#
# Set up Git and GitHub
#
fullName=$(git config --get user.name)
if [[ -z "$fullName" ]]; then
    read -p "  Enter your full name : " fullName
    git config --global user.name "$fullName"
fi

githubUser=$(git config --get github.user)
if [[ -z "$githubUser" ]]; then
    read -p "  Enter your GitHub username : " githubUser
    git config --global github.user "$githubUser"
fi

emailAddress=$(git config --get user.email)
if [[ -z "$emailAddress" ]]; then
    read -p "  Enter your email address : " emailAddress
    git config --global user.email "$emailAddress"
fi
credentialHelper=$(git config --get credential.helper)
if [[ -z "$credentialHelper" ]]; then
    # Set git to use the credential memory cache
    git config --global credential.helper cache
    # Set the cache to timeout after 1 hour (setting is in seconds)
    git config --global credential.helper 'cache --timeout=3600'
fi

# Generate an SSH public/private key if needed ...
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 4096 -C "$emailAddress"
    ssh-add ~/.ssh/id_rsa
fi

# Upload the SSH public key to GitHub ...
echo "Uploading SSH public key to GitHub user ${githubUser} ..."
curl --user "$githubUser" --data "{\"title\":\"frc4931dev\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" https://api.github.com/user/keys
