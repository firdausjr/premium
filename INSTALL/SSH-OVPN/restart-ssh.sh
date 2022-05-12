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

red=$(tput setaf 1)
green=$(tput setaf 2)
off=$(tput sgr 0)

# SSLH
sslh_services() {
systemctl restart sslh
sslh=$(systemctl status sslh | grep -i "active (running)")
if [[ $sslh == "" ]]; then
echo "  ${red}SSLH${off} > Service Error"
else
echo "  ${green}SSLH${off} > Service Restarted and Running"
fi
}

# OPENSSH
openssh_services() {
systemctl restart ssh
ssh=$(systemctl status ssh | grep -i "active (running)")
if [[ $ssh == "" ]]; then
echo "  ${red}OPEN SSH${off} > Service Error"
else
echo "  ${green}OPEN SSH${off} > Service Restarted and Running"
fi
}

# OPENSSH-WS
ws_openssh_services() {
systemctl restart ws-openssh
wsopen=$(systemctl status ws-openssh | grep -i "active (running)")
if [[ $wsopen == "" ]]; then
echo "  ${red}OPEN SSH WS${off} > Service Error"
else
echo "  ${green}OPEN SSH WS${off} > Service Restarted and Running"
fi
}

# DROPEBAR
dropbear_services() {
systemctl restart dropbear
drop=$(systemctl status dropbear | grep -i "active (running)")
if [[ $drop == "" ]]; then
echo "  ${red}DROPBEAR${off} > Service Error"
else
echo "  ${green}DROPBEAR${off} > Service Restarted and Running"
fi
}

# DROPEBAR-WS
ws_dropbear_services() {
systemctl restart ws-dropbear
wsdrop=$(systemctl status ws-dropbear | grep -i "active (running)")
if [[ $wsdrop == "" ]]; then
echo "  ${red}DROPBEAR WS${off} > Service Error"
else
echo "  ${green}DROPBEAR WS${off} > Service Restarted and Running"
fi
}

# STUNNEL4
stunnel4_services() {
systemctl restart stunnel4
ssl=$(systemctl status stunnel4 | grep -i "active (running)")
if [[ $ssl == "" ]]; then
echo "  ${red}S-TUNNEL4${off} > Service Error"
else
echo "  ${green}S-TUNNEL4${off} > Service Restarted and Running"
fi
}

# STUNNEL4-WS
ws_stunnel4_services() {
systemctl restart ws-stunnel4
wstls=$(systemctl status ws-stunnel4 | grep -i "active (running)")
if [[ $wstls == "" ]]; then
echo "  ${red}S-TUNNEL4 WS${off} > Service Error"
else
echo "  ${green}S-TUNNEL4 WS${off} > Service Restarted and Running"
fi
}

# OPENVPN
openvpn_services() {
systemctl restart openvpn
ovpn=$(systemctl status openvpn | grep -i "active (exited)")
if [[ $ovpn == "" ]]; then
echo "  ${red}OPEN VPN${off} > Service Error"
else
echo "  ${green}OPEN VPN${off} > Service Restarted and Running"
fi
}

# OPENVPN-WS
ws_openvpn_services() {
systemctl restart ws-openvpn
wsovpn=$(systemctl status ws-openvpn | grep -i "active (running)")
if [[ $wsovpn == "" ]]; then
echo "  ${red}OPEN VPN WS${off} > Service Error"
else
echo "  ${green}OPEN VPN WS${off} > Service Restarted and Running"
fi
}

# FAIL2BAN
fail2ban_services() {
systemctl restart fail2ban
fail2ban=$(systemctl status fail2ban | grep -i "active (running)")
if [[ $fail2ban == "" ]]; then
echo "  ${red}FAIL2BAN${off} > Service Error"
else
echo "  ${green}FAIL2BAN${off} > Service Restarted and Running"
fi
}

# SQUID-PROXY
squid_services() {
systemctl restart squid
squid=$(systemctl status squid | grep -i "active (running)")
if [[ $squid == "" ]]; then
echo "  ${red}SQUID PROXY${off} > Service Error"
else
echo "  ${green}SQUID PROXY${off} > Service Restarted and Running"
fi
}

# UDPGW
udpgw_services() {
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
echo "  ${green}UDPGW / BADVPN${off} > Service Restarted and Running"
}

# NGINX
nginx_services() {
systemctl restart nginx
nginx=$(systemctl status nginx | grep -i "active (running)")
if [[ $nginx == "" ]]; then
echo "  ${red}NGINX${off} > Service Error"
else
echo "  ${green}NGINX${off} > Service Restarted and Running"
fi
}
clear
figlet -f mini "restart ssh" | lolcat
echo ""
echo "    SYSTEM WILL RESTARTING  > SSLH Services!"
echo "                            > SSH Services!"
echo "                            > OVPN Services!"
echo "                            > ALL CDN Services!"
echo "                            > DROPBEAR Services!"
echo "                            > STUNNEL4 Services!"
echo "                            > OPEN VPN Services!"
echo "                            > SQUID Services!"
echo "                            > UDPGW Services!"
echo "                            > FAIL2BAN Services!"
echo "                            > NGINX Services!"
echo ""
read -rp "         Are you sure to restart this service ? (y/n) : " Restart
echo ""
case $Restart in
                Y | y | Yes | yes)
                echo -e "$(tput setaf 2)"
                echo -e "         This is take a several minutes, please wait for complete!"
                echo -e "$(tput sgr 0)"
		sslh_services
		openssh_services
		ws_openssh_services
		dropbear_services
		ws_dropbear_services
		stunnel4_services
		ws_stunnel4_services
		squid_services
		openvpn_services
		ws_openvpn_services
		udpgw_services
		fail2ban_services
                echo -e "$(tput setaf 2)"
                echo -e "          Service are Restarted and Running"
                echo -e "$(tput sgr 0)"
		sleep 2 && tessh
                ;;
                N | n | No | no)
                echo -e "          Restart is canceled!"
                sleep 2 && tessh
                ;;
                b)
                tessh
                ;;
                x)
                HOME
                ;;
                *)
                echo -e "       $(tput setaf 1) Please enter an correct number! $(tput sgr 0)"
                sleep 3
                restart-ssh
                ;;
esac
