#!/bin/bash

echo $(date)
echo "--------------------------------------------"
echo "Main Menu"
echo "--------------------------------------------"

function menu(){
	echo "1. Operating system info"
	echo "2. Hostname and DNS info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. Last logged in users"
	echo "6. My IP address"
	echo "7. My disk usage"
	echo "8. My home file-tree"
	echo "9. Proccess operations"
	echo "10. Exit"
	echo -n "Enter your choice [ 1 - 10 ] "
}

function sysInfo(){
	echo "--------------------------------------------"
	echo " System information"
	echo "--------------------------------------------"
	echo "Operating System : $(uname)"
	/usr/bin/lsb_release -a
}

function hostInfo(){
	echo "--------------------------------------------"
	echo " Hostname and DNS information"
	echo "--------------------------------------------"
	echo "Hostname : $(hostname)"
	echo "DNS domain : $(dnsdomainname)"
	echo "Fully qualified domain name : $(hostname --fqdn)"
	echo "Network address (IP) : $(hostname -i)"
	echo "DNS name servers (DNS IP) : $(cat /etc/resolv.conf | grep nameserver)"
}

function netInfo(){
	echo "--------------------------------------------"
	echo " Network information"
	echo "--------------------------------------------"
	echo "Total network interfaces found : $(ls -A /sys/class/net | wc -l)"
	echo "*** IP Addresses Information ***"
	ip addr
	echo "***********************"
	echo "*** Network routing ***"
	echo "***********************"
	netstat -rnf
	echo "*************************************"
	echo "*** Interface traffic information ***"
	echo "*************************************"
	netstat -i
}

function whoisOnline(){
	echo "--------------------------------------------"
	echo " Who is online"
	echo "--------------------------------------------"
	who -H
}

function lastLogged(){
	echo "--------------------------------------------"
	echo " List of last logged in users"
	echo "--------------------------------------------"
	last
}

function myIPAddress(){
	echo "--------------------------------------------"
	echo " Public IP information"
	echo "--------------------------------------------"
	dig +short myip.opendns.com @resolver1.opendns.com
}

function diskUsage(){
	echo "--------------------------------------------"
	echo " Disk Usage Info"
	echo "--------------------------------------------"
	df --output=pcent,target | sed 1d
}

function homefileTree(){
	echo "--------------------------------------------"
	echo " Home file-tree"
	echo "--------------------------------------------"
	echo " Generating files "
	sh ./proj1.sh /home/ filetree.html
	echo " Generation completed, output to filetree.html "
}

function processOperation(){
	sh ./proc.sh
}

while [ true ]
do
	menu
	read option
	case $option in
		1) 
		sysInfo
		;;
		2)
		hostInfo
		;;
		3)
		netInfo
		;;
		4)
		whoisOnline
		;;
		5)
		lastLogged
		;;
		6)
		myIPAddress
		;;
		7)
		diskUsage
		;;
		8)
		homefileTree
		;;
		9)
		processOperation
		;;
		10)
		break
		;;
		*)
		echo "Invalid option, please enter a number from 1 to 10 "
		;;
	esac
	
	if [ $option -eq 9 ] 
	then
		echo $(date)
		echo "--------------------------------------------"
		echo " Main Menu "
		echo "--------------------------------------------"
	elif [ $option -ne 10 ] 
	then
		read -p "Press [Enter] key to continue..."
		echo ""
	fi
done

