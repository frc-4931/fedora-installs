#!/bin/sh

Wpi_Installer(){

Dir=$(ls /home/$user/wpilib)

IFS=',' read -ra Dir <<< "$Dir"0

if [[ "${Dir[0]}" =~ ^[0-9]+$ ]]; then
  rm -rf ~/wpilib/${Dir[0]}
fi

all_tags=$(curl -s https://api.github.com/repos/wpilibsuite/allwpilib/releases | jq -r '.[].tag_name')

# Create an array of tags
IFS=$'\n' read -r -d '' -a tag_array <<< "$all_tags"

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
    
    echo ""
    echo "Use "0" unless specified otherwise"
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

rm -rf ~/pathplanner

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

    echo ""
    echo "Use "0" unless specified otherwise"
    read -p "Index: " selected_tag

    #gh release download <${selected_tag}> -p "PathPlanner-Linux-${selected_tag}.zip"

    zip=PathPlanner-Linux-${tag_array[$selected_tag]}.zip

    gh release download --clobber ${tag_array[$selected_tag]} -p "$zip" -O ./temp/pathplanner/${zip} --repo mjansen4857/pathplanner 

    unzip ./temp/pathplanner/${zip} -d ~/pathplanner

    wget -O ~/pathplanner/icon.ico https://raw.githubusercontent.com/mjansen4857/pathplanner/refs/heads/main/images/icon.ico

    echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Categories=Development
Name=PathPlanner
Comment=PathPlanner for the FIRST Robotics Competition
Exec=/home/$user/pathplanner/pathplanner
Icon=/home/$user/pathplanner/icon.ico
Terminal=false
StartupNotify=true
StartupWMClass=pathplanner" > ~/.local/share/applications/pathplanner.desktop

}



#
# Add/Fix Icons
#
Fixes(){
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

}

gitauth(){

    if ! gh auth status >/dev/null 2>&1; then
        gh auth login
        gh auth setup-git
    fi

    fullName=$(git config --get user.name)
    if [[ -z "$fullName" ]]; then
        read -p "  Enter your full name : " fullName
        git config --global user.name "$fullName"
    fi

    githubUser=$(git config --get github.user)
    if [[ -z "$githubUser" ]]; then
        read -p "  Enter your GitHub username : " githubUser
        git config --global github.user "$githubUser"
    fi

    emailAddress=$(git config --get user.email)
    if [[ -z "$emailAddress" ]]; then
        read -p "  Enter your email address : " emailAddress
        git config --global user.email "$emailAddress"
    fi

    echo ""
    echo "═════════════════ gh auth status ═════════════════"
    echo ""
    gh auth status
    echo ""
    echo "═════════════════ git config --list ═════════════════"
    echo ""
    git config --list
}


check_internet() {
    # Target a reliable host (Google's DNS) with a single packet and quiet output
    if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
        return 0 # Success (online)
    else
        return 1 # Failure (offline)
    fi
}

user=$(whoami)
Loop=y

if check_internet; then
    echo "Internet connection is present."
    InternetLoop=n
else
    echo "No internet connection."
    InternetLoop=y
fi

while [ $InternetLoop == "y" ]
do
    echo ""
    echo "╔═══════════════════════════════════╗"
    echo "║   No internet connection Found    ║"
    echo "╠═══════════════════════════════════╣"
    echo "║ 1: Retry Connecting               ║"
    echo "║ x: Exit Script                    ║"
    echo "╚═══════════════════════════════════╝"
    read -p "Choice: " Internet

    case "$Internet" in
        "1") 
            if check_internet; then
                echo "Internet connection is present."
                InternetLoop=n
            else
                echo "No internet connection."
                InternetLoop=y
            fi
        ;;
        "x") 
            echo "Exiting..."
            break
        ;;
        *)
            echo "$Internet is not a vaild input"
        ;;
    esac
done

while [ $Loop == "y" ]
do
    echo ""
    echo "╔═══════════════════════════════════╗"
    echo "║          Dev Tools Script         ║"
    echo "╠═══════════════════════════════════╣"
    echo "║ 1: Full Install                   ║"
    echo "║ 2: Install WPILib                 ║"
    echo "║ 3: Install Pathplanner            ║"
    echo "║ 4: GitHub Login                   ║"
    echo "║ x: Exit Script                    ║"
    echo "╚═══════════════════════════════════╝"
    read -p "Choice: " InstallChoice

    case "$InstallChoice" in
        "1") 
            gitauth
            Wpi_Installer
            Fixes
            PathPlanner_Installer
            break
        ;;
        "2") 
            Wpi_Installer
            Fixes
        ;;
        "3") 
            gitauth
            PathPlanner_Installer
        ;;
        "4") 
            gitauth
        ;;
        "x") 
            echo "Exiting..."
            break
        ;;
        *)
            echo "$InstallChoice is not a vaild input"
        ;;
    esac
done