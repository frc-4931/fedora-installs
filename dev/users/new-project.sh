#!/bin/sh

#
# Read the name of the computer user that will be created
echo ""
echo "Adding a new FRC4931 robot project in workspace $(pwd)"
echo ""
read -p "  Enter name of new Eclipse project : " projectName

#
strongback.sh new-project -e -p org.frc4931.robot -r ${projectName}




