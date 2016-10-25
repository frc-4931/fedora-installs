#!/bin/sh

repoName=$1
if [[ -z "$repoName" ]]; then
    #
    # Read the name of the computer user that will be created
    echo ""
    echo "Adding a GitHub repository in ~/dev directory"
    echo ""
    read -p "  Enter name of FRC4931 GitHub repository : " repoName
    if [[ -z "$repoName" ]]; then
        echo "Invalid repository name"
        exit 2
    fi
fi

if [[ ! -d "${HOME}/dev/${repoName}" ]]; then

    #
    # Read the GitHub username
    #
    githubUser=$(git config --get github.user)

    #
    # Set up the Eclipse workspace
    #
    oldDir=$(pwd)
    mkdir ~/dev
    cd ~/dev
    git clone git@github.com:${githubUser}/${repoName}
    if [[ $? -eq 0 ]]; then
        cd ${repoName}
        git remote add upstream https://github.com/frc-4931/${repoName}.git
        git fetch upstream
        git branch --set-upstream-to=upstream/master master
        git pull upstream master
        echo ""
        echo "Repository added at ${HOME}/dev/${repoName}."
        echo ""
        echo "Next: open Eclipse and switch workspaces to ${HOME}/dev/${repoName}, then import existing projects in this directory."
        echo ""
    else
        echo ""
        echo "Make sure that you've cloned the \"https://github.com/frc-4931/${repoName}\" repository, and then re-run."
        echo ""
        exit 1
    fi
    cd $oldDir

else
    echo ""
    echo "Repository already exists at ~/dev/${repoName}."
    echo ""
fi