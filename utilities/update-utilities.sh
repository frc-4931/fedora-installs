#!/bin/sh

#
# Install jq package if needed
#
if [ ! -f /usr/bin/jq ]; then
    echo "Installing additional packages"
    echo ""
    sudo dnf install -y jq
fi

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

#
# Discover the latest version of Strongback that's available
#
strongback_cli_version=$(curl -s https://api.github.com/repos/strongback/strongback-cli/releases/latest | jq -r '.name')

#
# Download the Strongback CLI version if required
#
existing_strongback_version=""
if [ -f ~/fedora-installs/utilities/strongback ]; then
  existing_strongback_version=$(strongback version | sed -n -e 's/^.*strongback cli version //p')
fi
if [[ "${existing_strongback_version}" != "${strongback_cli_version}" ]]; then
  echo ""
  echo "Installing Strongback CLI ${strongback_cli_version}"
  oldDir=$(pwd)
  cd ~/fedora-installs/utilities
  curl -s -L -o strongback-cli.tar.gz https://github.com/strongback/strongback-cli/releases/download/v${strongback_cli_version}/strongback-cli-${strongback_cli_version}-linux.tar.gz > /dev/null
  tar -xzf strongback-cli.tar.gz
  rm strongback-cli.tar.gz
  cd $oldDir
else
  echo "Latest available Strongback CLI version ${strongback_cli_version} is already installed"
fi


