#!/bin/sh

#
# Read the name of the computer user that will be created
echo ""
echo "Adding a GitHub repository in ~/dev directory"
echo ""
read -p "  Enter name of FRC4931 GitHub repository : " repoName

#
# Read the GitHub username
#
githubUser=$(git config --get github.user)

#
# Set up the Eclipse workspace
#
mkdir ~/dev
cd ~/dev
git clone https://github.com/${githubUser}/${repoName}
cd ${repoName}
git remote add upstream https://github.com/frc-4931/${repoName}.git
git fetch upstream
git branch --set-upstream-to=upstream/master master
git pull upstream master


