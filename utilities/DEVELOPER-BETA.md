# Developers and Beta Testers

These instructions can be used to install the Beta WPILib software and corresponding Strongback library.

If you have not done so already, go to https://github.com/frc-4931/2017-Beta, sign into your account, and click on the "Fork" button to fork that repository.

## Install the Beta software

Open a terminal and run the following command:

    $ update-utilities.sh

to obtain the latest version of these utilities. Then run:

    $ install-beta-devtools.sh

This will install the WPILib plugins into Eclipse (first uninstalling any existing plugins if already installed), install the latest version of Strongback, and gets the [2017-Beta codebase](https://github.com/frc-4931/2017-Beta).

## Open the Eclipse workspace

Start Eclipse, and switch to the "dev/2017-Beta" workspace:

1. Choose "File -> Switch Workspace -> Other..."
1. If you see the "2017-Beta" as an option, select it and skip step 3.
1. In the dialog look in the "dev" directory, select the "2017-Beta" directory, and pick "Ok" to open the workspace.

If you see no projects, go to "File -> Import..." and in the dialog type "existing" into the field, select the "Existing Projects into Workspace", and press the "Next" button. In the next page of the wizard, press the "Browse" button, select the "2017-Beta" directory, and press "Ok". In the dialog, check all of the boxes press "Finish".

## Configure WPILib

Create a new WPILib robot project by going to "New -> Project ..." and in the dialog type "robot" in the filter field, select "Robot Java Project" and click "Next". Enter the following information:

* Project name: "foo"
* Package: "org.frc4931.robot"

and then press "Finish". Another dialog may prompt you to enter the team number, so enter "4931" and press "OK". This creates installs the WPILib libraries, and creates a new project named "foo" that uses these libraries. Then, immediately delete this project:

1. Select the "foo" project in the "Package Explorer"
1. Choose "Edit -> Delete"
1. In the dialog box, check the box for "Delete project contents (this cannot be undone)", and press "Ok".

Finally, if Eclipse shows any errors in the "Problems" view, go to "Project -> Clean ..." and choose "Clean all projects" and press "Ok". 

## Create a new robot project

Create a new WPILib robot project using Eclipse:

1. Choose "New -> Project ..." and in the dialog type "robot" in the filter field, select "Robot Java Project" and click "Next". 
1. Enter Enter a project name
1. Enter `org.frc4931.robot` for the package name
1. Press "Finish"

This project should be ready to use Strongback and WPILib.
