#! /bin/bash
#------------# Mithun Parab [2106907] #----------------------------------------------------------#
#------------------------------------------------------------------------------------------------#
# Q.2) Accept the filename from the user and display a menu of choices for the user to select.   #
# (i)Check the existence of the file. if file not found ask the user if he wants to              #
#   create the file. If yes create the file.                                                     #
# (ii) If the file exists display the number of characters present in the file                   #
# (iii) Cut the file vertically after first 10 characters and                                    #
#       store it in the new file and display in                                                  #
# (iv) cut the file horizontally using head or tail command and                                  #
#      redirect output to the new file and display the file                                      #
# (v) copy the first file into second file                                                       #
# (vi) Exit                                                                                      # 
#------------------------------------------------------------------------------------------------#

set -eo pipefail
echo "Enter file Name: "
read FILE
PS3='Please enter your choice: '
options=("Check if file exist or create a new file" "If $FILE exist, Count characters in $FILE"
 "1st 10 characters vertically of $FILE" "1st 10 characters horizontally of $FILE" "copy $FILE to another file" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Check if file exist or create a new file")
            echo "you chose choice: 1. Check if file exist or create a new file \n"
            if [ -f "$FILE" ];
            then
                echo "Hooray!! $FILE exist"
            else
                echo "$FILE dosen't exist"
                read -p "Want to create file ? (Y/n)" ans
            if [[ "$ans" == "Y" || "$ans" == "Yes" || "$ans" == "yes" ]]; then
                touch "$FILE"
            else
                echo "You chose $ans insted of yes \n, Now programm is shutting down !\n"
                break
            fi
            fi
            ;;
        "If $FILE exist, Count characters in $FILE")
            echo "you chose choice: 2. If $FILE exist, Count characters in $FILE"
            if [ -f "$FILE" ];
            then
                charcount = wc -c "$FILE"
                echo "$charcount "
            else
                echo "$FILE dosen't exist!, \n To create file chose option 1. \n"
            fi
            ;;
        "1st 10 characters vertically of $FILE")
            echo "you chose choice: 3. 1st 10 characters vertically of $FILE"
            if [[ -f "$FILE" ]]; then
                cut -c 1-10 "$FILE" > newfile.txt
                cat newfile.txt
            else
                echo "$FILE dosen't exist!, \n To create file chose option 1. \n"
            fi
            ;;
        "1st 10 characters horizontally of $FILE")
            echo "you chose choice: 4. 1st 10 characters horizontally of $FILE"
            if [[ -f "$FILE" ]]; then
               head -n 10  "$FILE" > newfile.txt
               cat newfile.txt
            else
                echo "$FILE dosen't exist!, \n To create file chose option 1. \n"
            fi
            ;;
        "copy $FILE to another file")
            echo "5. copy $FILE to another file"
            if [[ -f "$FILE" ]]; then
               cp $FILE copyfile.txt
               cat copyfile.txt
            else
                echo "$FILE dosen't exist!, \n To create file chose option 1. \n"
            fi
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done