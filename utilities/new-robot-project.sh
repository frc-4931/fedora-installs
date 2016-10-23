#!/bin/sh

#
# Read the name of the computer user that will be created
projectName=$1
if [[ -z "$projectName" ]]; then
    read -p "  Enter name of new Eclipse project : " projectName
fi
echo ""
echo "Adding a new FRC4931 robot project in workspace $(pwd)"
echo ""

#
strongback.sh new-project -e -o -p org.frc4931.robot -r ${projectName}




