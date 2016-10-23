# Developers

Once the FRC4931 software [has been installed](http://github.com/frc-4931/fedora-installs/users/README.md), the user can follow these instructions if they are going to be developing software.

If you have not already, create a [GitHub](http://github.com) account and sign in, then go to https://github.com/frc-4931/2016-Robot and click on the "Fork" button to fork that repository.

## Install development tools

Open a terminal and run the following command:

    $ install-devtools.sh

to install some of the development tools and configures Git. If asked, enter your full name, GitHub username, and email address, followed by several questions needed to generate a new public/private SSH key so that GitHub can authenticate you (using the private key on this machine) without you having to enter a password.

The questions start with:

    Generating publi/private rsa key pair.
    Enter file in which to save the key (/home/<username>/.ssh/id_rsa):

Press enter to accept the default, and then the program will prompt for a passphrase:

    Enter passphrase (empty for no passphrase):

Enter a short 5+ character password/phrase that unlocks your primary key. You will need to remember this passphrase! The program will prompt you to reenter the passphrase, will then generate the public and private keys, and will then prompot you for your GitHub password so it can upload the public key to your GitHub account.

Finally, the program will then clone the https://github.com/frc-4931/2016-Robot repository.

*Close this terminal when completed.*

### Start Eclipse

Start Eclipse and choose `dev/2016-Robot` for the workspace location. Go to "File -> Import..." and in the dialog type "existing" into the field, select the "Existing Projects into Workspace", and press the "Next" button. In the next page of the wizard, press the "Browse" button, select the "2016-Robot" directory, and press "Ok". In the dialog, uncheck the "LiveMap" and "NetworkServer", then press "Finish".

There should be several problems with the code because the WPILib and Strongback libraries are not yet configured.

### Configure WPILib

When we've installed a new version of the WPILib plugins, we need to configure it by creating a new robot project. Do this by going to "New -> Project ..." and in the dialog type "robot" in the filter field, select "Robot Java Project". In the dialog box, enter "4931" for the team number (if asked) and click "Next". Then enter the following information:

* Project name: "foo"
* Package: "org.frc4931.robot"

and press "Finish". This creates installs the WPILib libraries, and creates a new project named "foo" that uses these libraries. 

## Configure Strongback

Also, because Strongback is newly installed, we need to configure it by opening a terminal and running the following commands:

    $ cd dev/2016-Robot
    $ new-robot-project.sh foo

This will set up Strongback and configure the `foo` project to use it. More importantly, it will also update Eclipse with the location of the Strongback libraries.

Go back to Eclipse, and choose "File -> Restart" to restart Eclipse. After Eclipse has restarted, select the "foo" project in the "Package Explorer", choose "Edit -> Delete", check the box for "Delete project contents (this cannot be undone)", and press "Ok". (If you get an error, dismiss the dialog and in the "Package Explorer" select the "foo" project, choose "File -> Refresh", and then try to delete the project again.)

### Import team preferences

In Eclipse, go to "File -> Import" and in the Import dialog expand "General", select "Preferences", and click "Next". Press the "Browse" button and navigate and select the `fedora-installs/eclipse/frc4931-eclipse-neon-preferences.epf` file and press "OK". Then press "Finish" in the "Import" dialog to complete the import.

At this point, you should see the `CompetitionRobot` project in the workspace and it should have no errors.



## Working with other workspaces and projects

You will periodically need to work with other FRC4931 team repositories and robot projects.

### Add a new FRC 4931 repository and Eclipse Workspace

Use the following procedure to get another FRC 4931 repository from GitHub and create a new Eclipse workspace for it.

If you have not already, sign into [GitHub](http://github.com), go to [https://github.com/frc-4931/]() and find the repository, and and click on the "Fork" button to fork that repository.

Then, go back to your terminal and type the following commands:

   $ cd ~/dev
   $ add-repo.sh

When prompted, enter the name of the FRC 4931 repository (e.g., `2016-Robot` or similar) and press return. This will use Git to clone your fork of the repository as the 'origin' remote, add the team's repository as the 'upstream' remote, and finish configuring the repository. The repository will be placed into the "dev" directory in your home directory.

Go back to Eclipse and choose "File -> Switch Workspace -> Other...". In the dialog look in the "dev" directory, select the "2016-Robot" directory, and pick "Ok". This will open a new workspace, and we now need to import the existing projects. Go to "File -> Import..." and in the dialog type "existing" into the field, select the "Existing Projects into Workspace", and press the "Next" button. In the next page of the wizard, press the "Browse" button, select the repository directory and press "Ok". In the dialog, check those projects in the repository you want to import, and press "Finish".

Next, [import team preferences](#import-team-preferences) into this workspace.

Then, go to "Window -> Preferences", then in the dialog navigate in the left tree to "Java -> Build Path -> User Libraries". Select "User Libraries", and in the right-hand side of the dialog click the "Import" button. In the new dialog, click the "Browse" button and find the `/strongback/java/eclipse/Strongback.userlibraries` file and click "Open". The list of user libraries should now include "Strongback". Then close the preferences dialog.

Finally, if Eclipse shows any errors in the "Problems" view, go to "Project -> Clean ..." and choose "Clean all projects" and press "Ok". 

### Create a new robot project

When you want to create a new robot project, open a terminal and run the following commands:

    $ cd dev/<repoName>

where `<repoName>` is the name of the repository directory. Then run:

    $ new-project.sh

This will prompt you for the name of the new Eclipse project, so type a name without spaces (e.g., "demo2") and press enter. Then, in Eclipse, go to "File -> Import..." and in the dialog type "existing" into the field, select the "Existing Projects into Workspace", and press the "Next" button. In the next page of the wizard, press the "Browse" button, select the "2016-Robot" directory, and press "Ok". In the dialog, check only the box next to your new project name, then press "Finish". You should see your new project in the "Package Explorer".


