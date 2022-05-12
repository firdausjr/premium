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

# COLOR
red=$(tput setaf 1)
green=$(tput setaf 2)
off=$(tput sgr 0)

# ALL SERVICES
all_services() {
sslh_services
openssh_services
ws_openssh_services
dropbear_services
ws_dropbear_services
stunnel4_services
ws_stunnel4_services
openvpn_services
ws_openvpn_services
squid_services
fail2ban_services
udpgw_services
vmess_tls_services
vmess_none_tls_services
vless_tls_services
vless_none_tls_services
trojan_services
trojan_go_services
shadowsocks_services
shadowsocksr_services
wireguard_services
ipsec_services
sstp_services
l2tp_services
pptp_services
cron_services
vnstat_services
nginx_services
}

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

# VMESS-TLS
vmess_tls_services() {
systemctl restart v2ray
v2ray=$(systemctl status v2ray | grep -i "active (running)")
if [[ $v2ray == "" ]]; then
echo "  ${red}VMESS TLS${off} > Service Error"
else
echo "  ${green}VMESS TLS${off} > Service Restarted and Running"
fi
}

# VMESS-NONE-TLS
vmess_none_tls_services() {
systemctl restart v2ray@none
v2none=$(systemctl status v2ray@none | grep -i "active (running)")
if [[ $v2none == "" ]]; then
echo "  ${red}VMESS NONE TLS${off} > Service Error"
else
echo "  ${green}VMESS NONE TLS${off} > Service Restarted and Running"
fi
}

# VLESS-TLS
vless_tls_services() {
systemctl restart v2ray@vless
vless=$(systemctl status v2ray@vless | grep -i "active (running)")
if [[ $vless == "" ]]; then
echo "  ${red}VLESS TLS${off} > Service Error"
else
echo "  ${green}VLESS TLS${off} > Service Restarted and Running"
fi
}

# VLESS-NONE-TLS
vless_none_tls_services() {
systemctl restart v2ray@vnone
vnone=$(systemctl status v2ray@vnone | grep -i "active (running)")
if [[ $vnone == "" ]]; then
echo "  ${red}VLESS TLS${off} > Service Error"
else
echo "  ${green}VLESS TLS${off} > Service Restarted and Running"
fi
}

# TROJAN
trojan_services() {
systemctl restart trojan
trojan=$(systemctl status trojan | grep -i "active (running)")
if [[ $trojan == "" ]]; then
echo "  ${red}TROJAN${off} > Service Error"
else
echo "  ${green}TROJAN${off} > Service Restarted and Running"
fi
}

# TROJAN-GO
trojan_go_services() {
trojango=$(systemctl status trojan-go | grep -i "active (running)")
if [[ $trojango == "" ]]; then
echo "  ${red}TROJAN GO${off} > Service Error"
else
echo "  ${green}TROJAN GO${off} > Service Restarted and Running"
fi
}

# SHADOWSOCKS
shadowsocks_services() {
systemctl restart shadowsocks-libev
shadow=$(systemctl status shadowsocks-libev | grep -i "active (running)")
if [[ $shadow == "" ]]; then
echo "  ${red}SHADOWSOCKS${off} > Service Error"
else
echo "  ${green}SHADOWSOCKS${off} > Service Restarted and Running"
fi
}

# SHADOWSOCKSR
shadowsocksr_services() {
systemctl restart ssrmu
ssr=$(systemctl status ssrmu | grep -i "active (running)")
if [[ $ssr == "" ]]; then
echo "  ${red}SHADOWSOCKS-R${off} > Service Error"
else
echo "  ${green}SHADOWSOCKS-R${off} > Service Restarted and Running"
fi
}

# WIREGUARD
wireguard_services() {
systemctl restart wg-quick@wg0
wg=$(systemctl status wg-quick@wg0 | grep -i "active (exited)")
if [[ $wg == "" ]]; then
echo "  ${red}WIREGUARD${off} > Service Error"
else
echo "  ${green}WIREGUARD${off} > Service Restarted and Running"
fi
}

# IPSEC
ipsec_services() {
ipsec=$(systemctl status ipsec | grep -i "active (running)")
if [[ $ipsec == "" ]]; then
echo "  ${red}IPSEC${off} > Service Error"
else
echo "  ${green}IPSEC${off} > Service Restarted and Running"
fi
}

# SSTP
sstp_services() {
sstp=$(systemctl status accel-ppp | grep -i "active (running)")
if [[ $sstp == "" ]]; then
echo "  ${red}SSTP${off} > Service Error"
else
echo "  ${green}SSTP${off} > Service Restarted and Running"
fi
}

# L2TP
l2tp_services() {
l2tp=$(systemctl status xl2tpd | grep -i "active (running)")
if [[ $l2tp == "" ]]; then
echo "  ${red}L2TP${off} > Service Error"
else
echo "  ${green}L2TP${off} > Service Restarted and Running"
fi
}

# PPTP
pptp_services() {
pptp=$(systemctl status pptpd | grep -i "active (running)")
if [[ $pptp == "" ]]; then
echo "  ${red}PPTP${off} > Service Error"
else
echo "  ${green}PPTP${off} > Service Restarted and Running"
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

# CRON-JOB
cron_services() {
systemctl restart cron
cron=$(systemctl status cron | grep -i "active (running)")
if [[ $cron == "" ]]; then
echo "  ${red}CRON${off} > Service Error"
else
echo "  ${green}CRON${off} > Service Restarted and Running"
fi
}

# VNSTAT
vnstat_services() {
vnstat=$(systemctl status vnstat | grep -i "active (running)")
if [[ $vnstat == "" ]]; then
echo "  ${red}VNSTAT${off} > Service Error"
else
echo "  ${green}VNSTAT${off} > Service Restarted and Running"
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

clear
figlet -f mini " Restart Services" | lolcat
echo "═══════════════════════════════════════" | lolcat
echo ""
echo "      1  )>  All SERVICES"
echo "      2  )>  SSLH"
echo "      3  )>  OPEN SSH"
echo "      4  )>  OPEN SSH WS"
echo "      5  )>  DROPBEAR"
echo "      6  )>  DROPBEAR WS"
echo "      7  )>  S-TUNNEL4"
echo "      8  )>  S-TUNNEL4 WS"
echo "      9  )>  OPEN VPN"
echo "     10  )>  OPEN VPN WS"
echo "     11  )>  PROXY SQUID"
echo "     12  )>  FAIL2BAN"
echo "     13  )>  BADVPN / UDPGW"
echo "     14  )>  VMESS TLS"
echo "     15  )>  VMESS NONE TLS"
echo "     16  )>  VLESS TLS"
echo "     17  )>  VLESS NONE TLS"
echo "     18  )>  TROJAN"
echo "     19  )>  TROJAN GO"
echo "     20  )>  SHADOWSOCKS"
echo "     21  )>  SHADOWSOCKS-R"
echo "     22  )>  WIREGUARD"
echo "     23  )>  IPSEC"
echo "     24  )>  SSTP"
echo "     25  )>  L2TP"
echo "     26  )>  PPTP"
echo "     27  )>  CRON JOB"
echo "     28  )>  VNSTAT"
echo "     29  )>  NGINX"
echo ""
echo "═══════════════════════════════════════" | lolcat
echo ""
echo "          {b} ${green}BACK${off}   {x} ${red}EXIT${off}"
echo ""
read -p "    What do you want :  " Restart
echo ""
case $Restart in
1)
all_services
sleep 2 && restart
;;

2)
sslh_services
sleep 2 && restart
;;

3)
openssh_services
sleep 2 && restart
;;

4)
ws_openssh_services
sleep 2 && restart
;;

5)
dropbear_services
sleep 2 && restart
;;

6)
ws_dropbear_services
sleep 2 && restart
;;

7)
stunnel4_services
sleep 2 && restart
;;

8)
ws_stunnel4_services
sleep 2 && restart
;;

9)
openvpn_services
sleep 2 && restart
;;

10)
ws_openvpn_services
sleep 2 && restart
;;

11)
squid_services
sleep 2 && restart
;;

12)
fail2ban_services
sleep 2 && restart
;;

13)
udpgw_services
sleep 2 && restart
;;

14)
vmess_tls_services
sleep 2 && restart
;;

15)
vmess_none_tls_services
sleep 2 && restart
;;

16)
vless_tls_services
sleep 2 && restart
;;

17)
vless_none_tls_services
sleep 2 && restart
;;

18)
trojan_services
sleep 2 && restart
;;

19)
trojan_go_services
sleep 2 && restart
;;

20)
shadowsocks_services
sleep 2 && restart
;;

21)
shadowsocksr_services
sleep 2 && restart
;;

22)
wireguard_services
sleep 2 && restart
;;

23)
ipsec_services
sleep 2 && restart
;;

24)
sstp_services
sleep 2 && restart
;;

25)
l2tp_services
sleep 2 && restart
;;

26)
pptp_services
sleep 2 && restart
;;

27)
cron_services
sleep 2 && restart
;;

28)
vnstat_services
sleep 2 && restart
;;

29)
nginx_services
sleep 2 && restart
;;

b)
settings
;;

x)
sudo -i
;;

*)
echo "       $(tput setaf 1) Option is not found! $(tput sgr 0)"
sleep 2 && restart
;;
esac
