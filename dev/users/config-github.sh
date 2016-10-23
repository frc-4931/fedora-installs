#!/bin/sh

#
# Read the name of the computer user that will be created
echo ""
echo "Setting up GitHub access"
echo ""
#
# Set up Git and GitHub
#
read -p "  Enter your full name : " fullName
read -p "  Enter your GitHub username : " githubUser
read -p "  Enter your email address : " emailAddress
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 4096 -C "$emailAddress"
    ssh-add ~/.ssh/id_rsa
fi
echo "Uploading SSH public key to GitHub user ${githubUser} ..."
curl --user "$githubUser" --data "{\"title\":\"frc4931dev\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" https://api.github.com/user/keys

#
# Configure Git
#
git config --global user.name "$fullName"
git config --global github.user "$githubUser"
git config --global user.email "$emailAddress"
# Set git to use the credential memory cache
git config --global credential.helper cache
# Set the cache to timeout after 1 hour (setting is in seconds)
git config --global credential.helper 'cache --timeout=3600'

#
# Set up the Eclipse workspace
#
repoName=2016-Robot
mkdir ~/dev
cd ~/dev
git clone https://github.com/${githubUser}/${repoName}
cd ${repoName}
git remote add upstream https://github.com/frc-4931/${repoName}.git
git fetch upstream
git branch --set-upstream-to=upstream/master master
git pull upstream master

#
strongback.sh new-project -e -p org.frc4931.robot -r CompetitionRobot




