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

IP=$(wget -qO- icanhazip.com);
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "     Username       : " -e user
		if [[ "$user" = "" ]]; then
		echo "       $(tput setaf 1) please choose a name.$(tput sgr 0)"
		sleep 3
		add-sstp
		fi

		CLIENT_EXISTS=$(grep -w $user /var/lib/premium-script/data-user-sstp | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "       $(tput setaf 1)A client with the specified name was already created, please choose another name!.$(tput sgr 0)"
			sleep 3
			add-sstp
		fi
	done
read -p "     Password       : " pass
read -p "     Expired (days) : " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat >> /home/sstp/sstp_account <<EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/premium-script/data-user-sstp"
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
echo -e "    -=SSTP VPN=-"
echo -e "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
echo -e "  Server IP     : $IP"
echo -e "  Username      : $user"
echo -e "  Password      : $pass"
echo -e "  Port          : $sstp"
echo -e "  Cert          : http://$IP:18/server.crt"
echo -e "  Expired On    : $(tput setaf 2)$exp$(tput sgr 0)"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
