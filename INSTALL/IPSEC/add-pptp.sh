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
PUBLIC_IP=$(wget -qO- icanhazip.com);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "       Username       : " -e VPN_USER
		if [[ "$VPN_USER" = "" ]]; then
		echo "       $(tput setaf 1) please choose a name.$(tput sgr 0)"
		sleep 3
		add-pptp
		fi

		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-pptp | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "       (tput setaf 1)A client with the specified name was already created, please choose another name.(tput sgr 0)"
			sleep 3
			add-pptp
		fi
	done
read -p "       Password       : " VPN_PASSWORD
read -p "       Expired (days) : " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" pptpd "$VPN_PASSWORD" *
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-pptp"
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
echo -e "   -=PPTP VPN=-"
echo -e "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
echo -e "Server IP    : $PUBLIC_IP"
echo -e "Username     : $VPN_USER"
echo -e "Password     : $VPN_PASSWORD"
echo -e "Expired On   : $(tput setaf 35)$exp$(tput sgr 0)"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
