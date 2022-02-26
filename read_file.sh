#! /bin/bash
#------------# Mithun Parab [2106907] #----------------------------#
#------------------------------------------------------------------#						
# Q.1) 1) Accept a file name and pattern to be found in the file.  #
# check if the file name entered by the user exist or not.         #
# check that User entering the file name and pattern is NOT NULL.  #
#------------------------------------------------------------------#
set -eo pipefail
echo "Enter file Name: "
read FILE
echo "Enter pattern: "
read SomeString
echo $FILE
if [ -f "$FILE" ];
then
if grep -q "$SomeString" "$FILE"
then
echo "Hooray!! $SomeString is in $FILE"
echo
else
echo "Oops!! $SomeString Not available"
echo
echo "Hooray!! $FILE exist"
fi
else
echo "$FILE dosen't exist"
fi