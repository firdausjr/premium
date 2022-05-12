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

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tls="8443"
none="80"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                read -rp "       Username       : " -e user
		if [[ "$user" = "" ]]; then
		echo " "
		echo "       $(tput setaf 1)Please choose a name!.$(tput sgr 0)"
		sleep 3
		add-ws
		fi
                CLIENT_EXISTS=$(grep -w $user /etc/v2ray/config.json | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
                echo ""
                echo "       $(tput setaf 1)A client with the specified name was already created, please choose another name.$(tput sgr 0)"
                sleep 3
		add-ws
                fi
        done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "       Expired (days) : " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"2"',"email": "'""$user""'"' /etc/v2ray/config.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"2"',"email": "'""$user""'"' /etc/v2ray/none.json
cat>/etc/v2ray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "2",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "Your_Bug",
      "tls": "tls"
}
EOF
cat>/etc/v2ray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "Your_Bug",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "2",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesslink1="vmess://$(base64 -w 0 /etc/v2ray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/v2ray/$user-none.json)"
echo -e ""
echo -e "       $(tput setaf 2)$user Success added for $masaaktif day"
sleep 1
echo -e "       Expired on $exp$(tput sgr 0)"
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
echo -e "   -=V2RAY-VMESS=-"
echo -e "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
echo -e "  Remarks        : ${user}"
echo -e "  CITY           : $CITY"
echo -e "  ISP            : $ISP"
echo -e "  Domain         : ${domain}"
echo -e "  port TLS       : ${tls}"
echo -e "  port none TLS  : ${none}"
echo -e "  id             : ${uuid}"
echo -e "  alterId        : 2"
echo -e "  Security       : auto"
echo -e "  network        : ws"
echo -e "  path           : /v2ray"
echo -e "  Expired on     : $(tput setaf 35)$exp$(tput sgr 0)"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e " #link TLS=-"
echo -e "${vmesslink1}"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e " #link NON TLS=-"
echo -e "${vmesslink2}"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
systemctl restart v2ray
systemctl restart v2ray@none
service cron restart
