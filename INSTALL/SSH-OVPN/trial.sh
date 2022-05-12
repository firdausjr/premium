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

# Data server
source /var/lib/premium-script/ipvps.conf
if [[ $IP == "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
IP=$(wget -qO- ipinfo.io/ip);
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(wget -qO- ipinfo.io/ip);

# Data port
openssh="22"
ws_openssh="2082"
dropbear="109, 143"
ws_dropbear="2095"
ssl="442, 443"
ws_ssl="443"
sqd="3128, 8080"
udpgw="7100, 7200, 7300"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ws_ovpn="2086"

# Adding user trial
Login=trial-`</dev/urandom tr -dc 1-9 | head -c4`
hari="1"
Pass=trial
echo -e ""
echo -e "       $(tput setaf 2)Adding account ssh $Login"
sleep 1
echo -e "       Setting Password $Pass $(tput sgr 0)"
sleep 1
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null

# Print user information
clear
echo -e ""
echo -e "    ------------------------------------------"
echo -e "-= |   COPY ALL TEXT FOR SHARE VIA WHATSAPP   | =-"
echo -e "    ------------------------------------------"
echo -e ""
echo -e "*#USER ACCOUNT SSH*"
echo -e " username      :  ${Login}"
echo -e " password      :  ${Pass}"
echo -e " expired at     :  ${exp}"
echo -e ""
echo -e "*#INFORMATION SERVER*"
echo -e " host domain  :   ${domain}"
echo -e " host ip           :   ${IP}"
echo -e " city server     :   ${CITY}"
echo -e " isp server      :   ${ISP}"
echo -e ""
echo -e " *#PORT SERVER AVAILABLE*"
echo -e " open ssh        :  ${openssh}"
echo -e " dropbear       :  ${dropbear}"
echo -e " ssl/tls            :  ${ssl}"
echo -e " squid proxy  :  ${sqd}"
echo -e " udpgw         :  ${udpgw}"
echo -e ""
echo -e " *#WEBSOCKET SUPPORTED*"
echo -e " open ssh        :  ${ws_openssh}"
echo -e " dropbear       :  ${ws_dropbear}"
echo -e " ssl/tls            :  ${ws_ssl}"
echo -e " openvpn       :  ${ws_ovpn}"
echo -e ""
echo -e "*#PAYLOAD WEBSOCKET NON TLS*"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: Websocket[crlf][crlf]"
echo -e ""
echo -e "*#PAYLOAD WEBSOCKET SSL/TLS*"
echo -e "GET wss://ruangguru.com [protocol][crlf]Host: $domain[crlf]Upgrade: Websocket[crlf][crlf]"
echo -e ""
echo -e "*#LINK OPEN VPN*"
echo -e "(TCP : $ovpn)"
echo -e "http://$domain:18/client-tcp-$ovpn.ovpn"
echo -e "(UDP : $ovpn2)"
echo -e "http://$domain:18/client-udp-$ovpn2.ovpn"
echo -e "(SSL : $ssl)"
echo -e "http://$domain:18/client-tcp-ssl.ovpn"
echo -e ""
echo -e "*#AUTOSCRIPT BY FIRDAUS PROJECT=-*"
echo -e ""
