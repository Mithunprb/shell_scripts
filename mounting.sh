#! /bin/bash
#------------# Mithun Parab [2106907] #----------#
# (ii) mount the file system					 #
#------------------------------------------------#
set -eo pipefail
echo "[Warning] Make sure your path to the file system is correct
       ie. if you want to mount usb eg. /media/usb"
echo "[Input] Enter path for mounting file system:"
            read MPATH
            echo "[Info] Creating mounting point at $MPATH"
            	if [[ mkdir "$MPATH" ]]; then
            		echo "[Info] $MPATH is created."
            		echo "[Input] Enter path to the file system:"
            		read FPATH
            			if [[ mount "$FPATH" "$MPATH" ]]; then
            				echo "[Info] $FPATH is mounted at $MPATH"
            				df -hT
            				echo "\n [Info] Read line at $FPATH and put it in /etc/fstab
            				 to enable persistent mounting of the file system \n"
            				echo "[Done] Program finished"
            			else
            				echo "[Error] $FPATH is invalid, Try again"
            				echo
            			fi
            	else
            		echo "[Error] $MPATH is not created, Try again!"
            		echo	
            	fi