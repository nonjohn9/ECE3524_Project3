#!/bin/bash

function showMenu(){
	echo "(please enter the number of your selection below)"
	echo ""
	echo "1. Show all processes"
	echo "2. Kill a process"
	echo "3. Bring up top"
	echo "4. Return to Main Menu"
	echo ""
}


while [ true ]
do
	showMenu
	read option1
	case $option1 in
	1)
	ps -ef
	;;
	2)
	echo "Please enter the PID of the process you would like to kill:"
	read processID
	kill $processID
	;;
	3)
	top
	;;
	4)
	break
	;;
	*)
	echo "Please select the correct choice"
	;;
	esac
	read -p "Press [Enter] key to continue..."
done
