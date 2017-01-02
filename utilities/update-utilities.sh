#!/bin/sh

strongback_cli_version=1.1.0

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

#
# Make a bin directory if needed
#
if [[ ! -d "${HOME}/bin" ]]; then
  mkdir -p ~/bin
  # add to the path if needed
  if [[ -z $(grep "\${HOME}/bin" ~/.bashrc) ]]; then
    echo "PATH=\${HOME}/bin/:\${PATH}" >> ~/.bashrc
    source ~/.bashrc
  fi
fi

# Download the Strongback CLI
echo ""
echo "Installing Strongback CLI ${strongback_cli_version}"
oldDir=$(pwd)
cd ~/fedora-installs/utilities
curl -L -o strongback-cli.tar.gz https://github.com/strongback/strongback-cli/releases/download/v${strongback_cli_version}/strongback-cli-${strongback_cli_version}-linux.tar.gz > /dev/null
tar -xzf strongback-cli.tar.gz
rm strongback-cli.tar.gz
cd $oldDir



