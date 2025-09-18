#!/bin/sh

Wpi_Installer(){
all_tags=$(curl -s https://api.github.com/repos/wpilibsuite/allwpilib/releases | jq -r '.[].tag_name')

# Create an array of tags
IFS=$'\n' read -r -d '' -a tag_array <<< "$all_tags"

# Output the array elements
# echo "All tags in list format:"
# for tag in "${tag_array[@]}"; do
#     echo "$tag"
# done

#echo "Number of elements: ${#tag_array[@]}"

declare -i MaxIndex=10
declare -i versioncount=0

echo ""
    echo "╔═══════╦═══════════════════════╗"
    echo "║ Index ║    WPILib Version     ║"
    echo "╠═══════╬═══════════════════════╣"
    
    
    for (( index = 0; index <= $MaxIndex; ++index ))
    do     
        
        x=`expr 20 - ${#tag_array[$index]}`
        tag=$(printf "${tag_array[$index]} %*s" $x)
        x=`expr 2 - ${#index}`
        indexf=$(printf "$index %*s" $x)

        echo "║   $indexf ║ $tag ║"

        versioncount=`expr ${versioncount} + 1`
        MaxIndex=`expr $MaxIndex + 1`

        if [ ${versioncount} == '5' ]
        then
            break
        fi
        
    done
    echo "╚═══════╩═══════════════════════╝"

    read -p "Index: " selected_tag

    URL=https://packages.wpilib.workers.dev/installer/${tag_array[$selected_tag]}/Linux/WPILib_Linux-${tag_array[$selected_tag]:1}.tar.gz

    echo "$URL"
    wget -O ./temp/wpilib.tar.gz $URL
    mkdir temp/wpilib
    tar -xvzf ./temp/wpilib.tar.gz -C ./temp/wpilib

    dir=$(ls temp/wpilib)
    echo "$dir"

    ./temp/wpilib/$dir/WPILibInstaller
}

PathPlanner_Installer(){
all_tags=$(curl -s https://api.github.com/repos/mjansen4857/pathplanner/releases | jq -r '.[].tag_name')

# Create an array of tags
IFS=$'\n' read -r -d '' -a tag_array <<< "$all_tags"

# Output the array elements
# echo "All tags in list format:"
# for tag in "${tag_array[@]}"; do
#     echo "$tag"
# done

#echo "Number of elements: ${#tag_array[@]}"

declare -i MaxIndex=10
declare -i versioncount=0

echo ""
    echo "╔═══════╦═══════════════════════╗"
    echo "║ Index ║  PathPlanner Version  ║"
    echo "╠═══════╬═══════════════════════╣"
    
    
    for (( index = 0; index <= $MaxIndex; ++index ))
    do     
        
        x=`expr 20 - ${#tag_array[$index]}`
        tag=$(printf "${tag_array[$index]} %*s" $x)
        x=`expr 2 - ${#index}`
        indexf=$(printf "$index %*s" $x)

        echo "║   $indexf ║ $tag ║"

        versioncount=`expr ${versioncount} + 1`
        MaxIndex=`expr $MaxIndex + 1`

        if [ ${versioncount} == '5' ]
        then
            break
        fi
        
    done
    echo "╚═══════╩═══════════════════════╝"

    read -p "Index: " selected_tag

    #gh release download <${selected_tag}> -p "PathPlanner-Linux-${selected_tag}.zip"

    zip=PathPlanner-Linux-${tag_array[$selected_tag]}.zip

    gh release download --clobber ${tag_array[$selected_tag]} -p "$zip" -O ./temp/pathplanner/${zip} --repo mjansen4857/pathplanner 

    unzip ./temp/pathplanner/${zip} -d ~/PathPlanner

    wget -O ~/PathPlanner/icon.ico https://raw.githubusercontent.com/mjansen4857/pathplanner/refs/heads/main/images/icon.ico

    echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Categories=Development
Name=PathPlanner
Comment=PathPlanner for the FIRST Robotics Competition
Exec=/home/$user/PathPlanner/pathplanner
Icon=/home/$user/PathPlanner/icon.ico
Terminal=false
StartupNotify=true
StartupWMClass=pathplanner" > ~/.local/share/applications/pathplanner.desktop

}

user=$(whoami)

#
# Install WPILib
#

#Wpi_Installer

#
# Install PathPlanner
#

#PathPlanner_Installer

#
# Add/Fix Icons
#

wget -O ~/wpilib/icons/AdvantageScope.png https://raw.githubusercontent.com/Mechanical-Advantage/AdvantageScope/refs/heads/main/icons/app/app-icons-linux/icon_128x128.png

echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Categories=Robotics;Science
Name=AdvantageScope (WPILib) 2025
Comment=AdvantageScope tool for the 2025 FIRST Robotics Competition season
Exec=/home/$user/wpilib/2025/tools/AdvantageScope.sh
Icon=/home/$user/wpilib/icons/AdvantageScope.png
Terminal=false
StartupNotify=true
StartupWMClass=AdvantageScope (WPILib)" > ~/.local/share/applications/AdvantageScope_WPILib_2025.desktop

wget -O ~/wpilib/icons/elastic-dashboard.png https://raw.githubusercontent.com/Gold872/elastic-dashboard/refs/heads/main/assets/logos/logo.png

echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Categories=Robotics;Science
Name=Elastic (WPILib) 2025
Comment=Elastic tool for the 2025 FIRST Robotics Competition season
Exec=/home/$user/wpilib/2025/tools/Elastic.sh
Icon=/home/$user/wpilib/icons/elastic-dashboard.png
Terminal=false
StartupNotify=true
StartupWMClass=elastic_dashboard" > ~/.local/share/applications/Elastic_WPILib_2025.desktop