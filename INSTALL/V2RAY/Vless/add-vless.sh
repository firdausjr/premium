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

source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
tls="2083"
none="8880"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "       Username       : " -e user
		if [[ "$user" = "" ]]; then
		echo "       $(tput setaf 1) please choose a name.$(tput sgr 0)"
		sleep 2
		add-vless
		fi

		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/vless.json | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "       $(tput setaf 1)A client with the specified name was already created, please choose another name.$(tput sgr 0)"
			sleep 2
			add-vless
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "       Expired (days) : " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vless.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vnone.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/v2ray&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/v2ray&encryption=none&type=ws#${user}"
echo -e ""
echo -e "       $(tput setaf 2)$user Success added for $masaaktif day"
sleep 1
echo -e "       Expired On $exp$(tput sgr 0)"
sleep 1
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Firdaus project <?>$(tput sgr 0)"
echo -e "---------------------------------------------------------------------------------------" | lolcat
echo -e "  <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <>  " | lolcat
echo -e "---------------------------------------------------------------------------------------" | lolcat
echo -e ""
echo -e ""
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e "   -=V2RAY-VLESS=-"
echo -e "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
echo -e "  Remarks        : ${user}"
echo -e "  Domain         : ${domain}"
echo -e "  CITY           : $CITY"
echo -e "  ISP            : $ISP"
echo -e "  port TLS       : $tls"
echo -e "  port none TLS  : $none"
echo -e "  id             : ${uuid}"
echo -e "  Encryption     : none"
echo -e "  network        : ws"
echo -e "  path           : /v2ray"
echo -e "  Expired on     : $(tput setaf 2)$exp$(tput sgr 0)"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e " #link TLS=-"
echo -e "${vlesslink1}"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e " #link NON TLS=-"
echo -e "${vlesslink2}"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
systemctl restart v2ray@vless
systemctl restart v2ray@vnone
service cron restart
