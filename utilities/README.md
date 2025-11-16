Upon receiving a new FRC4931 machine, log into your account using the password provided and change the password

## Developers

Once the FRC4931 software has been installed by an mentor, the user can follow these instructions if they are going to be developing software.

### First step

If you have not already, create a [GitHub](http://github.com) account and sign in, then go to https://github.com/frc-4931.

### Setup development tools

1. Open a terminal and navigate to the ```utilities``` directory.
Run the following command:

```bash
$ git clone http://github.com/frc-4931/fedora-installs
$ ./fedora-installs/utilities/install-devtools.sh
```

2. When prompted, select the first option: “Full Install.”

    This installs required development tools and configures Git

3. If asked, enter:
    
    - Your full name
    - Your GitHub username
    - Your email address
    - You may also need to answer a few questions to authenticate with GitHub.

4. The script will begin by installing WPILib.

    When asked to choose a version, select the top option (Latest).

5. After downloading, the WPILib installer will open.
    
    - Choose **“Everything”** -> Install for this User
    - Choose **"Download for this computer only"** -> Next
    - When the installer completes, click Finish.

6. Next, the script will install PathPlanner.

    When asked for a version, select the latest.

7. Once the script finishes, it will return you to a terminal prompt.

    You can now close the terminal.
