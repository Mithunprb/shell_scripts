#! /bin/bash
#------------# Mithun Parab [2106907] #----------#
# (i) Create a file system                       #
#------------------------------------------------#

set -eo pipefail
echo "[Warning] Make sure that path and label of file system is correct"
echo
echo "[Input] Enter partion name: "
	read PATH_PART
    	if [[ mkfs.ext4 "$PATH_PART" ]]; then
        	echo "[Info]File system at $PATH_PART is created."
        	echo
            echo "[Input] Enter label for file system name: "
            read LABLE
            echo
           		if [[ e4label "$PATH_PART" "$LABLE" ]]; then
            		echo "[Info] File system $LABLE is created at $PATH_PART"
            		echo
            	else
            		echo "[Error] $LABLE is not walid name"
            	fi
            	elif [[ mke4fs -t ext4 "$PATH_PART" ]]; then
            		echo "[Info]File system at $PATH_PART is created."
            		echo
            		echo "[Input] Enter label for file system name: "
            		read LABLE
            			if [[ exec e4label "$PATH_PART" "$LABLE" ]]; then
            				echo "[Info] File system $LABLE is created at $PATH_PART"
            				echo
            			else
            				echo "[Error] $LABLE is not walid name"
            				echo
            			fi
        else
            echo "[Error] Program failed!"
            echo "Check $PATH_PART again or run this script with sudo i.e. root"
            echo
        fi