#
# Install lastest WPILib
#

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


#
# Install PathPlanner
#



#
# Fix Icons
#

# https://github.com/Mechanical-Advantage/AdvantageScope/blob/main/icons/app/app-icon.ico
# https://github.com/mjansen4857/pathplanner/blob/main/images/icon.ico
