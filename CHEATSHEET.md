# Tips on using Fedora 24

[Linux](https://en.wikipedia.org/wiki/Linux) is a free and open source operating system. It is the most widely used OS in data centers and on nearly all of the fastest supercomputers. Linux is the operating system for all Android devices and many embedded systems such as TVs, set top boxes, network routers, and Internet of Things (IoT) devices. It is also used in about [2.5%](https://en.wikipedia.org/wiki/Linux) of desktops.

Fedora is a popular distribution sponsored by [Red Hat](http://redhat.com) (one of FRC4931's [sponsors](http://evilletech.com/spnosors)) and is the upstream for future versions of [Red Hat Enterprise Linux](https://en.wikipedia.org/wiki/Red_Hat_Enterprise_Linux), a Linux distribution targeted to the commercial market and fully supported by Red Hat.

This document provides tips on using Fedora and performing common tasks.

# Overview

When you log into your account on Fedora 24, you see a graphical user interface for easily running applications and managing the system. 

## Control Icons

The display's upper right corner has several icons and provides access to several controls and settings, including the ability to view or alter your settings, to log out of your account or switch users, and to power down the computer. 

## Clock and Calendar

The display's upper center of the screen shows the current day and time, and if you mouse over this you will see a calendar.

## Activities

The display's upper left corner has the "Activities" overview, which you can use to launch applications, find running application windows, and organize multiple "virtual desktops" workspaces. There are several ways of getting to the Activities overview:

* Click on "Activities"
* Press the [Windows key](https://en.wikipedia.org/wiki/Windows_key), also known as the "super" key or "option" key
* Whack your mouse to the upper left corner of the desktop. 

When activated, the Activities overview will show on the left a bar with icons of your favorite applications, the various "virtual desktops" on the left, each window for the running applications, and a "Type to search" field that is ready for you to type the name or keyword for an application (you can use the arrow keys to choose a result other than the first one, and press enter to launch the selected application).

TIP: Many users can quickly switch to or launch an application by pressing the Windows key and then typing the first few characters of the application and pressing enter.

## Workspaces

You can use the workspaces to organize your application windows into "virtual desktops". By default all application windows appear in the first workspace, but when in the Activities overview you can easily drag any of the windows to a separate workspace and click on a workspace to use it.

## Application menu

The application that is currently active, the name of the application appears as a menu next to the 
One of the fastest ways to switch an application is to  the Windows key 


# Keyboard shortcuts

Fedora comes with many keyboard shortcuts that let you quickly use the keyboard to do things that you normally might do using the mouse and multiple clicks. When you learn these, it can be much faster to use them instead of using your mouse, especially when your hands are already on the keyboard.

A few of the most useful shortcuts are:

* `ALT` + `TAB`: Switch between running applications. Press repeatedly to toggle between the application icons, and release when the application you want is selected.
* `ALT` + <key above `TAB`>: Switch between windows in current application
* `CTRL` + `ALT` + `Up/down arrow`: Switch between workspaces
* `F11`: Toggle current window to full screen
* `SUPER` + `Up arrow`: Maximize current window
* `SUPER` + `Down arrow`: Un-maximize current window
* `SUPER` + `Left arrow`: Dock current window to the left half of the screen
* `SUPER` + `Right arrow`: Dock current window to the right half of the screen

# Terminal

The *Terminal* application provides a command line shell to issue commands to navigate the file system, view/edit files and system status and configuration, run applications, and more. In Linux, the terminal is the most powerful application, since everything on the system can be controlled can be monitored, controlled, or used via commands.

## Paths

The file system is a hierarchical tree-like structure, and every location in that structure can be described by _paths_. 

### Absolute paths

An _absolute path_ describes how to get to a location from the very top of the tree, and begins with a `/` character and contains one or more directory or filenames separated by the `/` character. A few examples of absolute paths include:

* `/home/jsmith`,
* `/opt/google/chrome', and 
* `/home/jsmith/wpilib/java/current/lib/WPILib.jar`.

### Relative paths

A _relative path_ describes how to get to a location from the current location, which may begin by going up or down from the current location. Relative paths begin with something other than the `/` character, and they use `..` to go up one level and `.` to reference the current level. A path that begins with the `~` character is relative to the user's _home directory_. The simplest example of a relative path is a directory or filename, which refers to the directory or file relative to the current working directory. 

Some examples of relative paths include: 

* `Documents` (refers to the `Documents` folder or file in the current directory), 
* `lib`, which refers to the `lib` directory or file in the current directory,
* `hello.txt`, which refers to the directory or file named `hello.txt`,
* `~` refers to the users home directory, 
* `..` refers to the parent directory, and
* `../doc/intro.txt`, which refers to the `intro.txt` file in the `doc` directory under the parent directory.

## Tab completion

The terminal supports _tab completion_, which is a very handy way to speed up typing commands. Just hit `TAB` while typing a command, option, or file name and the shell environment will automatically complete what you’re typing or suggest options to you. Tab completion is very useful when typing paths, since the computer will help ensure you are typing a valid path that exists.

## Navigating the filesystem

Some useful commands to navigate the file system include:

* `pwd`, or _print working directory_: Display the absolute path of the directory in which the shell is currently sitting.
* `ls` or _list_: Display the contents of the current directory in short form.
* `ll` or _long list_: Display the contents of the current directory in long (detailed) form.
* `ll -a`: Display _all_ the contents of the current directory in long (detailed) form, including _hidden_ files whose names begin with a period (`.`) character.
* `cd _<path>_`, or _change directory_: Change the current working of the shell to a different directory as specified by the given absolute or relative path.

## File and directory names

Unlike Windows, Linux does not require filenames to have extensions or prevent directory names from including the `.` character. This can sometimes make it tough to know whether something is a file or a directory, but usually the `ls` and `ll` commands will color code the output to denote the difference. Also, the first character of each line of output of the `ll` command will use a `d` for directory or `-` for a file. 

## Working with directories

Some useful commands to work with directories include:

* `cp -r _<dir-path>_ _<parent-dir-path>_`, or _recursively copy_: Copy a directory and everything in it to a new directory with the same name in the specified parent directory.
* `rmdir _<path>_`, or _remove directory_; Remove an empty directory at the given path.
* `rmdir -rf _<path>_`, or _recursively and forcibly remove directory_; Remove a directory _and everything it contains_, given by the path.
* `mkdir _<path>_`, or _make directory_: Create a new directory at the given path

## Working with files

Some useful commands to work with files include:

* `cp _<from-path>_ _<to-path>_`: Copy a file and place the new file at a specific location.
* `touch _<path-to-file>_`: Create a new, empty file at the given path.
* `cat _<path-to-file>_`, or _concatenate_ a file: Output the contents of the file.
* `more _<path-to-file>_`: Output the contents of the file one page at a time.
* `chmod _<mode>_ _<path-to-file>_`: Change the access privilieges for the file or directory, where `_<mode>_` represents the new privileges for user, group, and world. You generally have to use this command to change a file to be executable.


# Updating software

Fedora will let you know when there are updates to the software that you have installed, but it will not by default automatically install these updates. All of the software we install for FRC4931 is installed using `dnf`, the new and improved version of the older `yum` package manager. Using `dnf` requires administrative privileges.

To check for an install updates to all software, open a terminal and run the following command:

    $ dnf update

This will take a minute while DNF downloads information about what's currently available, and then uses this to find whether any of the software installed has updates. It will display all updates that can be installed, and ask you whether you want to download and install them.

Downloading and installing updates can take a while for systems that are not kept up to date.

You can view a history of the updates with:

    $ dnf history

and you can even undo or redo specific transactions in the history. See [online documentation](https://docs.fedoraproject.org/en-US/Fedora/24/html/System_Administrators_Guide/sec-DNF-Transaction_History.html) for details.


