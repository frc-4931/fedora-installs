#!/bin/sh

#
# Install the FRC4931 utilities if necessary
#
if [[ -d "${HOME}/fedora-installs" ]]; then
    #
    # Upgrade the FRC4931 scripts
    #
    echo ""
    echo "Upgading FRC4931 user utilities"
    oldDir=$(pwd)
    cd ~/fedora-installs
    git pull
    cd $oldDir
    echo ""
else
    cd ~
    git clone https://github.com/frc-4931/fedora-installs.git
fi

#
# Make sure the FRC4931 utilities are on our path
#
if [[ -z $(grep "fedora-installs" ~/.bashrc) ]]; then
    echo "PATH=\${HOME}/fedora-installs/utilities/:\${PATH}" >> ~/.bashrc
    source ~/.bashrc
fi

#
# Install the default Chrome bookmarks
#
if [[ ! -f "${HOME}/.config/google-chrome/Default/Bookmarks" ]]; then
    mkdir -p ~/.config/google-chrome/Default/
    cp ~/fedora-installs/chrome/Bookmarks ~/.config/google-chrome/Default/
fi

