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

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr 0)
echo "---------------------------------------------------"
echo "|    USERNAME   |    EXP DATE   |     STATUS      |"
echo "---------------------------------------------------"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
	if [[ $ID -ge 1000 ]]; then
		if [[ "$status" = "L" ]]; then
			printf "%-17s %2s %-17s %2s \n" "  $AKUN" " $exp     " " ${RED}LOCKED${NORMAL}"
		else
			printf "%-17s %2s %-17s %2s \n" "  $AKUN" " $exp     " " ${GREEN}UNLOCKED${NORMAL}"
		fi
	fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo ""
echo "---------------------------------------------------"
echo "  Total Accounts Registered : $(tput setaf 2)$JUMLAH user$(tput sgr 0)"
echo "---------------------------------------------------"
echo ""