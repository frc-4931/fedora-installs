# Users

Upon receiving a new FRC4931 machine, log into your account using the password provided and change the password:

1. Click on "Activities" in the upper left corner of the screen
1. Type "users" in the search box and click on the "Users" application
1. Click the field to the right of the "Password" label, enter your current password and the new password, and press the "Change" button. The "Change" button will only enable when the new password is valid.

## Arrange Favorites

We recommend adding the following to your favorite applications under "Activities":

* Chrome
* Slack
* Eclipse
* Terminal
* Files
* Text Editor
* System Monitor
* Help

by searching for them, right-mouse clicking the application, and choosing "Add to Favorites". You can drag and drop the applications in the favorites bar to reorder them. 

We also recommend removing all other applications by right-mouse clicking the app in the favorites bar and choosing "Remove from Favorites".

## Tutorials

To learn more about how to use Fedora and it's GNOME desktop environment, click on "Activities" in the upper left corner of the screen, type "help" in the search box, and click on the "Help" application. Click on the "Getting Started with GNOME" or any of the other topics.

## Slack

Start Slack and log into the "frc4931.slack.com" team using your account.

## Utilities

The utilities may occasionally need to be updated, and you can get the latest at any time. To do this, open a terminal and run the following command:

    $ update-utilities.sh

If this returns "command is not found", then utilities have not yet been installed in your account. To add them, run the following commands in the terminal:

    $ cd ~/
    $ git clone https://github.com/frc-4931/fedora-installs.git
    $ echo "PATH=$HOME/fedora-installs/utilities/:\${PATH}" >> ~/.bashrc
    $ source ~/.bashrc

Try running the `update-utilities.sh` command again to verify everything is installed correctly.

## Developers

To install the development tools, follow [these instructions](https://github.com/frc-4931/fedora-installs/blob/master/utilities/DEVELOPER.md).