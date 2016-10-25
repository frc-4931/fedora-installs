# fedora-installs

This repository contains utilities and instructions for installing Fedora.

## Making USB Media for installing Fedora

Download the [Fedora Workstation image](https://getfedora.org/en/workstation/) to your local machine, and then follow [these instructions](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-making-usb-media.html) to create a bootable USB thumb drive with Fedora.

## Install Fedora

Plug the USB media into the machine and (re)boot the machine, pressing and holding F2, F12 or the blue "ThinkVantage" button until the choice is presented to boot from the USB media. (If the machine boots normally, reboot and look when it first starts up for the key that is to be pressed for boot options.)

In the Fedora installer, choose to install Fedora onto the machine's hard drive. Be sure to set the time & date, a unique hostname (e.g., `frc4931dev01`), choose the system destination (optionally reclaiming space by deleting all existing disks), and begin the installation. While the software is being installed:

1. set the root password; and
1. create a single "Admin" user, check "Make this user administrator", and set the same password as the root password.

When installation is complete:

1. quit the installer,
1. turn off the machine,
1. remove the USB media from the machine,
1. turn on the machine, and 
1. log in as the "Admin" user

Upon login, complete the setup process, including connecting to a wi-fi network. Then proceed with installing the FRC 4931 utilities

## Install FRC 4931 utilities

When logged in as the "Admin" user, open a terminal and run the following commands:

    $ git clone http://github.com/frc-4931/fedora-installs
    $ sudo ./fedora-installs/install.sh

The first command downloads the latest version of the utilites in this repository. The second command runs the `install.sh` script as root, and so the system will prompt you to enter the administrative password. As the script runs, it will ask whether you want to create user accounts and, if so, ask for information about the user accounts. Once users have been created, the remaining steps are completely automated and require no other input while it installs the following:

* system updates
* [Git](https://git-scm.com)
* [OpenJDK 8](http://openjdk.java.net)
* [Eclipse](http://eclipse.org)
* [Chrome](http://google.com/chrome)
* [Slack](http://slack.com)
* [Fritzing](http://fritzing.org/)
* [Arduino](http://arduino.cc)
* FRC 4931 utilities for each user

The system updates do take a while (perhaps an hour or so depending upon the Internet connection speed), but you can leave it run or you can watch the progress as it works. When it completes, log out of the administrative account, log into each of the developer accounts and run the following:

    $ ./fedora-installs/utilities/install-devtools.sh

When that completes, close the terminal and arrange the favorites to include the following:

* Chrome
* Slack
* Eclipse
* Terminal
* Files
* Text Editor
* System Monitor
* Fritzing
* Arduino

Log out and the machine should be ready to give to the team member. When then get the machine, have them follow [these instructions](https://github.com/frc-4931/fedora-installs/blob/master/utilities/README.md).
