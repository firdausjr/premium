#!/bin/bash
# Check Service By Days Project

# Colour text
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

# Information
Active=" [ ${green}ACTIVE - RUNNING${NC} ]"
ERROR="[ ${red}ERROR - NO RUNNING${NC} ]"

# Check all services

# SSLH
sslh=$(systemctl status sslh | grep -i "active (running)")
if [[ $sslh == "" ]]; then
      ssslh=$ERROR
else
      ssslh=$Active
fi

# OPENSSH
ssh=$(systemctl status ssh | grep -i "active (running)")
if [[ $ssh == "" ]]; then
      sssh=$ERROR
else
      sssh=$Active
fi

# OPENSSH-WS
wsopen=$(systemctl status ws-openssh | grep -i "active (running)")
if [[ $wsopen == "" ]]; then
swsopen=$ERROR
else
swsopen=$Active
fi

# STUNNEL4
ssl=$(systemctl status stunnel4 | grep -i "active (running)")
if [[ $ssl == "" ]]; then
      sssl=$ERROR
else
      sssl=$Active
fi

# STUNNEL4-WS
wstls=$(systemctl status ws-stunnel4 | grep -i "active (running)")
if [[ $wstls == "" ]]; then
      swstls=$ERROR
else
      swstls=$Active
fi

# DROPBEAR
drop=$(systemctl status dropbear | grep -i "active (running)")
if [[ $drop == "" ]]; then
      sdrop=$ERROR
else
      sdrop=$Active
fi

# DROPEBAR-WS
wsdrop=$(systemctl status ws-dropbear | grep -i "active (running)")
if [[ $wsdrop == "" ]]; then
      swsdrop=$ERROR
else
      swsdrop=$Active
fi

# OPENVPN
ovpn=$(systemctl status openvpn | grep -i "active (exited)")
if [[ $ovpn == "" ]]; then
      sovpn=$ERROR
else
      sovpn=$Active
fi

# OPENVPN-WS
wsovpn=$(systemctl status ws-openvpn | grep -i "active (running)")
if [[ $wsovpn == "" ]]; then
      swsovpn=$ERROR
else
      swsovpn=$Active
fi

# FAIL2BAN
fail2ban=$(systemctl status fail2ban | grep -i "active (running)")
if [[ $fail2ban == "" ]]; then
      sfail2ban=$ERROR
else
      sfail2ban=$Active
fi

# VMESS-TLS
v2ray=$(systemctl status v2ray | grep -i "active (running)")
if [[ $v2ray == "" ]]; then
      sv2ray=$ERROR
else
      sv2ray=$Active
fi

# VMESS-NONE-TLS
v2none=$(systemctl status v2ray@none | grep -i "active (running)")
if [[ $v2none == "" ]]; then
      sv2none=$ERROR
else
      sv2none=$Active
fi

# VLESS-TLS
vless=$(systemctl status v2ray@vless | grep -i "active (running)")
if [[ $vless == "" ]]; then
      svless=$ERROR
else
      svless=$Active
fi

# VLESS-NONE-TLS
vnone=$(systemctl status v2ray@vnone | grep -i "active (running)")
if [[ $vnone == "" ]]; then
      svnone=$ERROR
else
      svnone=$Active
fi

# TROJAN
trojan=$(systemctl status trojan | grep -i "active (running)")
if [[ $trojan == "" ]]; then
      strojan=$ERROR
else
      strojan=$Active
fi

# TROJAN-GO
trojango=$(systemctl status trojan-go | grep -i "active (running)")
if [[ $trojango == "" ]]; then
      strojango=$ERROR
else
      strojango=$Active
fi

# SHADOWSOCKS
shadow=$(systemctl status shadowsocks-libev | grep -i "active (running)")
if [[ $shadow == "" ]]; then
      sshadow=$ERROR
else
      sshadow=$Active
fi

# SHADOWSOCKSR
ssr=$(systemctl status ssrmu | grep -i "active (running)")
if [[ $ssr == "" ]]; then
      sssr=$ERROR
else
      sssr=$Active
fi

# WIREGUARD
wg=$(systemctl status wg-quick@wg0 | grep -i "active (exited)")
if [[ $wg == "" ]]; then
      swg=$ERROR
else
      swg=$Active
fi

# IPSEC
ipsec=$(systemctl status ipsec | grep -i "active (running)")
if [[ $ipsec == "" ]]; then
      sipsec=$ERROR
else
      sipsec=$Active
fi

# SSTP
sstp=$(systemctl status accel-ppp | grep -i "active (running)")
if [[ $sstp == "" ]]; then
      ssstp=$ERROR
else
      ssstp=$Active
fi

# L2TP
l2tp=$(systemctl status xl2tpd | grep -i "active (running)")
if [[ $l2tp == "" ]]; then
      sl2tp=$ERROR
else
      sl2tp=$Active
fi

# PPTP
pptp=$(systemctl status pptpd | grep -i "active (running)")
if [[ $pptp == "" ]]; then
      spptp=$ERROR
else
      spptp=$Active
fi

# NGINX
nginx=$(systemctl status nginx | grep -i "active (running)")
if [[ $nginx == "" ]]; then
      snginx=$ERROR
else
      snginx=$Active
fi

# SQUID-PROXY
squid=$(systemctl status squid | grep -i "active (running)")
if [[ $squid == "" ]]; then
      ssquid=$ERROR
else
      ssquid=$Active
fi

# CRON-JOB
cron=$(systemctl status cron | grep -i "active (running)")
if [[ $cron == "" ]]; then
      scron=$ERROR
else
      scron=$Active
fi

# VNSTAT
vnstat=$(systemctl status vnstat | grep -i "active (running)")
if [[ $vnstat == "" ]]; then
      svnstat=$ERROR
else
      svnstat=$Active
fi

clear
echo -e "  ${bold}═══════════════════════════════-[ ${green}SERVICES STATUS${NC} ]-═══════════════════════════════${off}"
echo -e ""
echo -e "          - SSLH                                     $ssslh"
echo -e "          - OPEN SSH                                 $sssh"
echo -e "          - OPEN SSH WEBSOCKET                       $swsopen"
echo -e "          - DROPBEAR                                 $sdrop"
echo -e "          - DROPBEAR WEBSOCKET                       $swsdrop"
echo -e "          - STUNNEL4                                 $sssl"
echo -e "          - STUNNEL4 WEBSOCKET                       $swstls"
echo -e "          - OPEN VPN                                 $sovpn"
echo -e "          - OPEN VPN WEBSOCKET                       $swsovpn"
echo -e "          - VMESS TLS                                $sv2ray"
echo -e "          - VMESS NONE TLS                           $sv2none"
echo -e "          - VLESS TLS                                $svless"
echo -e "          - VLESS NONE TLS                           $svnone"
echo -e "          - SHADOWSOCKS                              $sshadow"
echo -e "          - SHADOWSOCKS-R                            $sssr"
echo -e "          - WIREGUARD                                $swg"
echo -e "          - TROJAN                                   $strojan"
echo -e "          - TROJAN-GO                                $strojango"
echo -e "          - IPSEC                                    $sipsec"
echo -e "          - SSTP                                     $ssstp"
echo -e "          - PPTP                                     $spptp"
echo -e "          - L2TP                                     $sl2tp"
echo -e "          - WEBSERVER NGINX                          $snginx"
echo -e "          - SQUID PROXY                              $ssquid"
echo -e "          - CRON JOB                                 $scron"
echo -e "          - FAIL2BAN                                 $sfail2ban"
echo -e "          - VNSTAT                                   $svnstat "
echo -e ""
echo -e  "${bold}═════════════════════════════════════════════════════════════════════════════════════${off}"
echo -e ""
echo -e "                                 {b} $(tput setaf 2)BACK$(tput sgr 0)    {x} $(tput setaf 1)EXIT$(tput sgr 0)"
echo -e ""
read -p "     What do you want :  " back
case $back in
      b | back | BACK | B)
      settings
      ;;
      *)
      HOME
      ;;
esac