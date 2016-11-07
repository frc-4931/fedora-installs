# fedora-installs

This repository contains utilities and instructions for installing Fedora. See our [Fedora cheatsheet](https://github.com/frc-4931/fedora-installs/blob/master/CHEATSHEET.md) for tips on using Fedora.

Installing an operating system is always a bit different than with other software, because the computer can't be running an operating system on a hard drive that you're going to reformat. Instead, we're going to create a USB thumb drive with the Fedora operating system and installer, and then we'll insert that into the target computer and boot using the operating system on the USB thumb drive. It will then automatically run the program to install Fedora on the target computer and reformat its disk drives. When that's done, we'll turn off the computer, remove the USB drive, and power up the computer, which will then be running the Fedora operating system.

**This process is destructive, and you will lose all data on the drives.** The installer can be used to install Fedora on part of the drives (separate partitions), but that is beyond the scope of these instructions.

## Making USB Media for installing Fedora

Download the [Fedora Workstation image](https://getfedora.org/en/workstation/) to your local machine, and then follow [these instructions](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-making-usb-media.html) to create a bootable USB thumb drive with the Fedora installer. Formatting the USB drive takes roughly 10 minutes, so if you have a lot of machines to image you may want to format several USB drives so you can image multiple computers at once.

## Install Fedora

Plug the USB media into the machine and (re)boot the machine, pressing and holding F2, F12 or the blue "ThinkVantage" button until the choice is presented to boot from the USB media. (If the machine boots normally, reboot and look when it first starts up for the key that is to be pressed for boot options. If the machine still doesn't find the USB drive, then you can change the boot configuration to look for a USB Hard Disk Drive (HDD) before it looks for the machine's hard drive.)

When the machine boots with the Fedora installer on the USB drive, it will automatically start up the Fedora installer and will let you configure several options about the new installation. Specifically, you have to say on which hard drives (or partitions) you wish to install Fedora, the time zone of the computer, and specify a unique network hostname (e.g., `frc4931dev01`). Then the installer will begin formatting the drives and installing Fedora. While this happens, the installer will ask for additional information:

1. set the root password; and
1. create a single "Admin" user (or another username for the admin account), check "Make this user administrator", and set the same password as the root password.

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

The system updates do take a while (perhaps an hour or so depending upon the Internet connection speed), but you can leave it run or you can watch the progress as it works. When it completes, log out of the administrative account, log into each of the developer accounts and run the following to install WPILib and Strongback:

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
