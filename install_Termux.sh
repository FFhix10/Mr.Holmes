#!/bin/bash
# AUTHOR: Lucksi
# Copyright © 2021 Lucksi
# License: GNU General Public License v3.0

. /etc/os-release
DIST="$ID"
BLUE=$(tput setaf 6)
GREEN=$(tput setaf 2)
WHITE=$(tput setaf 15)
LIGHTGREEN=$(tput setaf 10)

function banner {
	clear
	reader=$(<"Banners/Banner6.txt")
	echo "${GREEN}$reader"
}

function Packet_Installer {
	proot -0 pkg install git &> /dev/null | printf "${WHITE}\nINSTALLING GIT\n"
	proot -0 pkg install python3 &> /dev/null | printf "${WHITE}\nINSTALLING PYTHON3\n"
    proot -0 pkg install python3-pip &> /dev/null | printf "${WHITE}\nINSTALLING PIP"
	proot -0 pkg install whois &> /dev/null | printf "${WHITE}\n\nINSTALLING WHOIS"
    proot -0 pkg install tracepath &> /dev/null | printf "${WHITE}\n\nINSTALLING TRACEROUTE"
    proot -0 pkg install php &> /dev/null | printf "${WHITE}\n\nINSTALLING PHP"
	proot -0 pip3 install -r requirements.txt &> /dev/null | printf "${BLUE}\n\nINSTALLING-PYTHON-REQUIREMENTS..."
	printf "${GREEN}\n\n[+]${WHITE}REQUIREMENTS INSTALLED SUCCESFULLY${GREEN}[+]"
}

function Options {
	printf "${WHITE}\n\nINSERT YOUR RECIPIENT EMAIL\n\n"
	read -p"$GREEN[#MR.HOLMES#]$WHITE-->" recipient
	while [ "$recipient" = "" ];
		do
        printf "${WHITE}\nINSERT YOUR RECIPIENT EMAIL\n\n"
        read -p"$GREEN[#MR.HOLMES#]$WHITE-->" recipient
	done
	printf "${WHITE}\nINSERT YOUR EMAIL PASSWORD\n\n"
	read -sp"$GREEN[#MR.HOLMES#]$WHITE-->" password
	while [ "$password" = "" ];
		do
        printf "${WHITE}\nINSERT YOUR EMAIL PASSWORD\n\n"
        read -sp"$GREEN[#MR.HOLMES#]$WHITE-->" password
    done
	printf "${WHITE}\n\nINSERT YOUR DESTINATION EMAIL\n\n"
	read -p"$GREEN[#MR.HOLMES#]$WHITE-->" destination
	while [ "$destination" = "" ];
		do
        printf "${WHITE}\nINSERT YOUR DESTINATION EMAIL\n\n"
        read -p"$GREEN[#MR.HOLMES#]$WHITE-->" destination
	done
	printf "${WHITE}\nINSERT YOUR SMTP SERVER EX smtp.test.com\n\n"
	read -p"$GREEN[#MR.HOLMES#]$WHITE-->" server
	while [ "$server" = "" ];
		do
        printf "${WHITE}\nINSERT YOUR SMTP SERVER EX smtp.test.com\n\n"
        read -p"$GREEN[#MR.HOLMES#]$WHITE-->" server
	done
	printf "${WHITE}\nINSERT YOUR SMTP SERVER PORT EX 768\n\n"
	read -p"$GREEN[#MR.HOLMES#]$WHITE-->" port
	while [ "$port" = "" ];
		do
        printf "${WHITE}\nINSERT YOUR SMTP SERVER PORT \n\n"
        read -p"$GREEN[#MR.HOLMES#]$WHITE-->" port
	done
	printf "${WHITE}\nINSERT YOUR UPDATE-PASSWORD\n\n"
	read -sp"$GREEN[#MR.HOLMES#]$WHITE-->" up_pass
	while [ "$up_pass" = "" ];
		do
        printf "${WHITE}\nINSERT YOUR UPDATE-PASSWORD \n\n"
        read -sp"$GREEN[#MR.HOLMES#]$WHITE-->" up_pass
	done
	printf "${WHITE}\n\nINSERT YOUR WHO-IS-XMLAPI-KEY(LEAVE EMPTY IF YOU HAVENT ONE)\n\n"
	read -p"$GREEN[#MR.HOLMES#]$WHITE-->" key
	if [ "$key" == "" ];
		then
		key="None"
	fi
	printf "${WHITE}\n\nINSERT YOUR PROXY_LIST FULL-PATH(LEAVE EMPTY IF YOU WANT THE DEFAULT LIST)\n\n"
	read -p"$GREEN[#MR.HOLMES#]$WHITE-->" proxies
	if [ "$proxies" == "" ];
		then
		proxies="Proxies/Proxy_list.txt"
	fi
	printf "${WHITE}\n\nWOULD YOU LIKE TO SAVE YOUR LOG SESSIONS(1)YES(2)NO\n\n"
	read -p"$GREEN[#MR.HOLMES#]$WHITE-->" Logs
	if [ $Logs == 2 ];
		then
		Logs="False"
	else [ $Logs == 1 ]
		Logs="True"
	fi
	printf "${BLUE}\nCREATING CONFIGURATION FILE"
	cd Configuration
	echo ";CHANGE THESE VALUE IF YOU WANT TO UPDATE YOUR SETTINGS FROM HERE">Configuration.ini
	echo ";BUT DO NOT CHANGE THE PARAMETERS NAME">>Configuration.ini
	echo "">>Configuration.ini
	echo "[Smtp]">>Configuration.ini
	echo "Email = $recipient">>Configuration.ini
	echo "Password = $password">>Configuration.ini
	echo "Destination = $destination">>Configuration.ini
	echo "Server= $server">>Configuration.ini
	echo "Port= $port">>Configuration.ini
	echo "">>Configuration.ini
	echo "[Settings]">>Configuration.ini
	echo "Password = $up_pass">>Configuration.ini
	echo "Api_Key = $key">>Configuration.ini 
	echo "Proxy_List" = $proxies>>Configuration.ini
	echo "Show_Logs = $Logs">>Configuration.ini
	rm UNTILED.txt &> /dev/null
}


function installer {
	printf "${BLUE}\n\nCHECKING LINUX DISTRIBUTION..."
	sleep 2
	printf "${GREEN}\n\n[+]${WHITE}LINUX DISTRIBITIUN FOUND:$DIST${GREEN}[+]"
	printf "${BLUE}\n\nWELCOME TO THE INSTALLATION MANAGER WOULD YOU LIKE TO BEGIN(1)YES(2)NO\n\n"
	read -p "$GREEN[#MR.HOLMES#]$WHITE-->" confvar
	if [ $confvar == 1 ]; 
		then
		Packet_Installer
		Options
		cd ../
		cd Core
		printf "\n\nGIVING PERMISSION TO LUNCH FOR CORE FILES"
		proot -0 chmod +x update.sh
		cd ../
		cd ../
		echo "Path = `pwd`">>Mr.Holmes/Configuration/Configuration.ini
		sleep 2
		printf "${GREEN}\n\n[+]${WHITE}PROGRAM INSTALLED CORRECTLY${GREEN}[+]"
		printf "${LIGHTGREEN}\n\nTHANK YOU FOR HAVE INSTALLED Mr.Holmes\n\n"
		exit 1
    fi
	printf "\n${BLUE}INSTALLATION INTERRUPTED EXIT...\n\n"
    exit 1
}
banner
installer
