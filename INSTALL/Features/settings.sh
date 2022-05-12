#!/bin/bash

# Information owner this script
server_owner=https://raw.githubusercontent.com/firdausjr/premium/main

# Check permision access
  IPVPS=$(curl -s ipv4.icanhazip.com)
  IZIN=$(curl -s ${server_owner}/Autoscript/member_premium | grep ${IPVPS} | cut -d ' ' -f 1)
  if [[ $IPVPS = $IZIN ]]; then
  echo ""
  else
  clear
  figlet Firdaus project | lolcat
  echo ""
  echo "   AUTOSCRIPT HAS EXPIRED"
  echo ""
  echo "   THIS OWNER CONTACT   > WHATSAPP : +6282232547380"
  echo "                        > TELEGRAM : @FirdauzVpn"
  echo "                        > EMAIL    : mobilemvp99@gmail.com"
  echo ""
  echo "   THIS CREATOR CONTACT > WHATSAPP : +6287891876989"
  echo "                        > TELEGRAM : @DaysVPN"
  echo "                        > EMAIL    : shantree.anonyzer01@gmail.com"
  echo ""
  exit 1
  fi

# Detect a problem
  if [[ -e /etc/debian_version ]]; then
  OS=debian
  RCLOCAL='/etc/rc.local'
  elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
  OS=centos
  RCLOCAL='/etc/rc.d/rc.local'
  chmod +x /etc/rc.d/rc.local
  else
  echo ""
  echo ""
  echo "   Im Sorry, We Are Maintancing This AutoScript for Many Times,"
  echo "   Please Wait For NEW Realease!"
  echo ""
  exit
  fi

# Check domain
  source /var/lib/premium-script/ipvps.conf
  if [[ $IP == "" ]]; then
  domain=$(cat /etc/v2ray/domain)
  else
  domain=$IP
  fi

# Check version autoscript
  if [ ! $(cat /home/ver) = "" ]; then
        old=$(cat /home/ver)
        who=Firdaus-Project
        check=$(curl -s ${server_owner}/Autoscript/version | grep ^${who})
        if [[ ${check} = ${who} ]]; then
              new=$(curl -s ${server_owner}/Autoscript/version | grep ^${old} | cut -d ' ' -f 3)
              if [[ "$old" < "$new" ]]; then
                     update=AVAILABLE-TO-{V.$new}
              elif [[ "$new" > "$old" ]]; then
                      update=PLEASE-DOWNGRADE-TO-{V.$new}
              else
                      update=UP-TO-DATE-{V.$old}
              fi
         else
              update=NOT-YET-AVAILABLE
         fi
  else
        update=CURENT-VERSION-NOT-FOUND
  fi

clear # screen for menu settings
figlet Firdaus project | lolcat
echo ""
echo "═════════════════════════════════════════════════════" | lolcat
echo "|                 -=Manage Your VPS=-               |"
echo "═════════════════════════════════════════════════════" | lolcat
echo ""
echo "   1.  Add Subdomain Host For VPS"
echo "   2.  Gett Certificate $domain"
echo "   3.  Set Autobackup VPS"
echo "   4.  Backup Data VPS"
echo "   5.  Restore Data VPS"
echo "   6.  Webmin Manager"
echo "   7.  Check status All Services"
echo "   8.  Check Usage of VPS Ram"
echo "   9.  Reboot VPS Now"
echo "  10.  Speedtest VPS"
echo "  11.  Information Instalations AutoScript"
echo "  12.  OUR About AutoScript"
echo "  13.  Restart All Service"
echo "  14.  Set Auto Reboot"
echo "  15.  Set Multi Login Services"
echo "  16.  Change Your Password VPS"
echo "  17.  Check Bandwidth Used of Monthly"
echo "  18.  Change a banner"
echo "  19.  UPDATE AUTOSCRIPT $(tput setaf 2)${update}$(tput sgr 0)"
echo ""
echo "═════════════════════════════════════════════════════" | lolcat
echo ""
echo "                  {b} $(tput setaf 2)BACK$(tput sgr 0)   {x} $(tput setaf 1)EXIT$(tput sgr 0)"
echo ""
read -p "     What do you want :  "  num
echo ""
case $num in  # first from options setting
	1) # Add Subdomain Host For VPS
		add-host
		;;
	2) # Gett Certificate domain
		echo "       $(tput setaf 2)Start . . .$(tput sgr 0)"
		echo ""
		sleep 2
		systemctl stop v2ray ; systemctl stop v2ray@none
		/root/.acme.sh/acme.sh --issue --force -d $domain --standalone -k ec-256
		~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
		systemctl start v2ray ; systemctl start v2ray@none
		echo ""
		echo "       $(tput setaf 2)Done$(tput sgr 0)"
		echo ""
		;;
	3) # Set Autobackup VPS
		autobackup
		;;
	4) # Backup Data VPS
		backup
		;;
	5) # Restore Data VPS
		restore
		;;
	6) # Webmin Manager
		wbmn
		;;
	7) # Check status All Services
		status
		;;
	8) # Check Usage of VPS Ram
		ram
		;;
	9) # Reboot VPS Now
		secs=$((10))
		while [ $secs -gt -1 ]; do
		   echo -ne "   Reboot system will be done in { $(tput setaf 2)${secs}$(tput sgr 0) } seconds\033[0K\r"
		   sleep 1
		   : $((secs--))
		done
		# Clear log
		if [ -f /var/log/v2ray/access.log ]; then
			echo "" > /var/log/v2ray/access.log
		fi
		if [ -f /var/log/v2ray/access2.log ]; then
			echo "" > /var/log/v2ray/access2.log
		fi
		if [ -f /var/log/v2ray/error.log ]; then
			echo "" > /var/log/v2ray/error.log
		fi
		if [ -f /var/log/trojan-go.log ]; then
			echo "" > /var/log/trojan-go.log
		fi
		if [ -f /var/log/trojan.log ]; then
			echo "" > /var/log/trojan.log
		fi
		if [ -d /var/log/journal ]; then
			rm -rf /var/log/journal
		fi
		history -c
		# Reboot
		echo ""
		echo ""
		echo "$(date +"%T") - $(date +"%m/%d/%Y")    >>  SERVER IS REBOOTED" >> /root/log-reboot.txt
		echo "   the system is being restarted, please wait a while for it to be ready to use"
		echo ""
		reboot
		;;
	10) # Speedtest VPS
		speedtest -a
		echo ""
		;;
	11) # Information Instalations AutoScript
		clear && cat /root/log-install.txt
		echo ""
		;;
	12) # OUR About AutoScript
		about
		;;
	13) # Restart All Service
		restart
		;;
	14) # Set Auto Reboot
		auto-reboot
		;;
	15) # Set Multi Login Services
		autokill
		;;
	16) # Change Your Password VPS
		passwd
		echo ""
		;;
	17) # Check Bandwidth Used of Monthly
		vnstat -m
		echo ""
		;;
	18) # Change a banner
		mcedit /etc/issue.net
		;;
	19) # UPDATE AUTOSCRIPT
		if [[ ${update} = "NOT-YET-AVAILABLE" ]]; then
			echo "  $(tput setaf 2)NOT YET AVAILABLE, PLEASE WAIT FOR A MOMENT$(tput sgr 0)"
			sleep 3 && settings
		elif [[ ${update} = "CURENT-VERSION-NOT-FOUND" ]]; then
			echo "         $(tput setaf 1)SORRY, WE CAN'T SEE YOUR VERSION$(tput sgr 0)"
			sleep 3 && settings
		elif [[ ${update} = "UP-TO-DATE-{V.$old}" ]]; then
			echo "               $(tput setaf 2)YOUR VERSION IS LATEST$(tput sgr 0)"
			sleep 3 && settings
		else
			cd && wget -qO update-${new} ${server_owner}/update-${new} && chmod +x update-${new} && ./update-${new} && rm -rf update-${new}
		fi
		;;
	b) # Back
		menu
		;;
	x) # Exit
		sudo -i
		;;
	*) # No anyone
		echo "     $(tput setaf 1)Please enter a correct number!$(tput sgr 0)"
		echo ""
		;;
esac