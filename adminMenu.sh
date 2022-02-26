#! /bin/bash
#------------# Mithun Parab [2106907] #----------#
#------------------------------------------------#
# Q.3) System Admin Based Menu:                  #
# (i) Create a file system                       #
# (ii) mount the file system                     #
# (iii) Create the backup of the entire disk     #
# (iv) Compress any file from and store it       #
#------------------------------------------------#
set -eo pipefail
echo "[Warning] Make sure you are running this script as sudo ie. with root privilege."
echo
echo "[Warning] Input should not contain empty space in start or in the end."
echo
PS3='[Input] Please enter your choice: '
options=("Create a file system" "Mount the file system" "Create the backup of the entire disk" "Compress any file from and store it" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create a file system")
	   bash ./filesystem.sh
            ;;
        "Mount the file system")
            bash ./mounting.sh
            ;;
        "Create the backup of the entire disk")
            echo "[Info] wait till we gather all files....."
            bash ./backup.sh
            ;;
        "Compress any file from and store it ")
            echo "[Input] Enter the file to Compress:"
            read compfile
            tar -czvf "$compfile".tar.gz *
            tar -tvf "$compfile".tar.gz
            ;;
        "Quit")
            break
            ;;
        *) echo "[Error] invalid option $REPLY";;
    esac
done
