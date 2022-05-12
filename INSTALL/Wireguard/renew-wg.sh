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

source /etc/wireguard/params
NUMBER_OF_CLIENTS=$(grep -c -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
	echo ""
	echo "     You have no existing clients!"
	sleep 3
	wgg
fi
echo ""
echo " Press CTRL+C to return"
echo " Select an existing client that you want to renew"
echo " ================================================" | lolcat
echo ""
grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3-4 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
	if [[ ${CLIENT_NUMBER} == '1' ]]; then
                echo ""
		read -rp "     Select one client [1] : " CLIENT_NUMBER
                echo ""
	else
                echo ""
		read -rp "     Select one client [1-${NUMBER_OF_CLIENTS}] : " CLIENT_NUMBER
                echo ""
	fi
done
read -p "     Expired (days) : " masaaktif
user=$(grep -E "^### Client" "/etc/wireguard/wg0.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### Client" "/etc/wireguard/wg0.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### Client $user $exp/### Client $user $exp4/g" /etc/wireguard/wg0.conf
echo ""
echo " Wireguard Account Has Been Successfully Renewed"
echo " ===============================================" | lolcat
echo " Client Name : $user"
echo " Expired  On: $exp4"
echo ""
