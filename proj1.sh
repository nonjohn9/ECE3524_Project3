#!/bin/sh
# author: John Xu
# PID: nonjohn9

# $1 is the root directory 
# $2 is the destination file
function traverse(){
	for FILE in $(find $1 -maxdepth 1 )
	do
		# Two variable for testing purpose
		# printf "Value FILE is $FILE\n"
		# printf "Value s1 is $1\n"
		if [[ -d $FILE && $FILE != $1 ]]
		then
			echo "<li>${FILE}</li>" >>$2
			echo "<ul>" >>$2
			traverse $FILE $2
			echo "</ul>" >>$2
		elif [[ -r $FILE && -f $FILE ]]
		then
			local foo=${FILE#"$1"}
			
			echo "<li>" >>$2
			echo "<a href="${FILE}">${foo}</a>" >>$2
			echo "</li>" >>$2
		fi
	done
}

if [ $# -ne 2 ] 
then
	echo "Number of command is not equal to 2, Please restart with correct number of input"
elif [ $# -eq 2 ] 
then
	# Title
	echo "<h1>$1</h1>" >>$2
	# bracket for unordered list
	echo "<ul>" >>$2
	traverse $1 $2
	echo "</ul>" >>$2
fi


