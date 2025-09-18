# Developers

Once the FRC4931 software [has been installed](http://github.com/frc-4931/fedora-installs/users/README.md), the user can follow these instructions if they are going to be developing software.

## First step

If you have not already, create a [GitHub](http://github.com) account and sign in, then go to https://github.com/frc-4931

## Setup development tools

Open a terminal and run the following command:

    $ config-github.sh

to install some of the development tools and configures Git. If asked, enter your full name, GitHub username, and email address, followed by several questions needed to generate a new public/private SSH key so that GitHub can authenticate you (using the private key on this machine) without you having to enter a password.

The questions start with:

    Generating publi/private rsa key pair.
    Enter file in which to save the key (/home/<username>/.ssh/id_rsa):

Press enter to accept the default, and then the program will prompt for a passphrase:

    Enter passphrase (empty for no passphrase):

Enter a short 5+ character password/phrase that unlocks your primary key. You will need to remember this passphrase! The program will prompt you to reenter the passphrase, will then generate the public and private keys, and will then prompot you for your GitHub password so it can upload the public key to your GitHub account.

*Close this terminal.*


### Import team preferences

In Eclipse, go to "File -> Import" and in the Import dialog expand "General", select "Preferences", and click "Next". Press the "Browse" button and navigate and select the `fedora-installs/eclipse/frc4931-eclipse-neon-preferences.epf` file and press "OK". Then press "Finish" in the "Import" dialog to complete the import.

At this point, you should see the `CompetitionRobot` project in the workspace and it should have no errors.


## Working with other workspaces and projects

You will periodically need to work with other FRC4931 team repositories and robot projects.

### Create a new robot project

When you want to create a new robot project, open a terminal and run the following commands:

    $ cd dev/<repoName>

where `<repoName>` is the name of the repository directory. Then run:

    $ new-robot-project.sh

This will prompt you for the name of the new Eclipse project, so type a name without spaces (e.g., "demo2") and press enter. Then, in Eclipse, go to "File -> Import..." and in the dialog type "existing" into the field, select the "Existing Projects into Workspace", and press the "Next" button. In the next page of the wizard, press the "Browse" button, select the "2016-Robot" directory, and press "Ok". In the dialog, check only the box next to your new project name, then press "Finish". You should see your new project in the "Package Explorer".


