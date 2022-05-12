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

# Load params
source /etc/wireguard/params
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
SERVER_PUB_IP=$(wget -qO- icanhazip.com);
else
SERVER_PUB_IP=$IP
fi
	until [[ ${CLIENT_NAME} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "       Username       : " -e CLIENT_NAME
		if [[ "$CLIENT_NAME" = "" ]]; then
		echo "       $(tput setaf 1)Please choose a name.$(tput sgr 0)"
		sleep 2
		add-wg
		fi

		CLIENT_EXISTS=$(grep -w $CLIENT_NAME /etc/wireguard/wg0.conf | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "       $(tput setaf 1)A client with the specified name was already created, please choose another name.$(tput sgr 0)"
			sleep 2
			add-wg
		fi
	done
	ENDPOINT="$SERVER_PUB_IP:$SERVER_PORT"
	WG_CONFIG="/etc/wireguard/wg0.conf"
	LASTIP=$( grep "/32" $WG_CONFIG | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4 )
	if [[ "$LASTIP" = "" ]]; then
	CLIENT_ADDRESS="10.66.66.2"
	else
	CLIENT_ADDRESS="10.66.66.$((LASTIP+1))"
	fi

	# Adguard DNS by default
	CLIENT_DNS_1="176.103.130.130"

	CLIENT_DNS_2="176.103.130.131"
	MYIP=$(wget -qO- ifconfig.co);
	read -p "       Expired (days) : " masaaktif
	exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

	# Generate key pair for the client
	CLIENT_PRIV_KEY=$(wg genkey)
	CLIENT_PUB_KEY=$(echo "$CLIENT_PRIV_KEY" | wg pubkey)
	CLIENT_PRE_SHARED_KEY=$(wg genpsk)

	# Create client file and add the server as a peer
	echo "[Interface]
PrivateKey = $CLIENT_PRIV_KEY
Address = $CLIENT_ADDRESS/24
DNS = $CLIENT_DNS_1,$CLIENT_DNS_2

[Peer]
PublicKey = $SERVER_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
Endpoint = $ENDPOINT
AllowedIPs = 0.0.0.0/0,::/0" >>"$HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf"

	# Add the client as a peer to the server
	echo -e "### Client $CLIENT_NAME $exp
[Peer]
PublicKey = $CLIENT_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
AllowedIPs = $CLIENT_ADDRESS/32" >>"/etc/wireguard/$SERVER_WG_NIC.conf"
	systemctl restart "wg-quick@$SERVER_WG_NIC"
	cp $HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf /home/vps/public_html/$CLIENT_NAME.conf
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
echo -e "   -=Wireguard=-"
echo -e "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
echo -e " http://$MYIP:18/$CLIENT_NAME.conf"
echo -e " Expired On  : $(tput setaf 2)$exp$(tput sgr 0)"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
rm -f /root/wg0-client-$CLIENT_NAME.conf
