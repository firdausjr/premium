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

read -rp "   !> Domain : " -e domain
echo ""
if [[ "$domain" = "" ]]; then
	echo "   $(tput setaf 1)Please Field a domain!$(tput sgr 0)"
	sleep 2
	add-host
else
echo "   $(tput setaf 2)Start for Adding and install cert from host domain $domain$(tput sgr 0)"
sleep 5
echo ""
systemctl stop v2ray
systemctl stop v2ray@none
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
echo ""
read -rp "   What is that Success  ? (y/n) : " yna
echo ""
case $yna in
Y)
echo "IP=$domain" >> /var/lib/premium-script/ipvps.conf
sleep 2
echo "   $(tput setaf 2)We are saving your domain $domain$(tput sgr 0) $(tput setaf 3)in /var/lib/premium-script/ipvps.conf$(tput sgr 0)"
echo ""
;;
y)
echo "IP=$domain" >> /var/lib/premium-script/ipvps.conf
sleep 2
echo "   $(tput setaf 2)We are saving your domain $domain$(tput sgr 0) $(tput setaf 3)in /var/lib/premium-script/ipvps.conf$(tput sgr 0)"
echo ""
;;
N)
echo "   $(tput setaf 1)Maybe Your domain inserted is not registered from cloudflare"
echo "   Please first time, register your domain from cloudflare and try again!$(tput sgr 0)"
echo ""
;;
n)
echo "   $(tput setaf 1)Maybe Your domain inserted is not registered from cloudflare"
echo "   Please first time, register your domain from cloudflare and try again!$(tput sgr 0)"
echo ""
;;
*)
echo "   $(tput setaf 1)Sorry your domain is not saved, because you are no answer my question!$(tput sgr 0)"
echo ""
;;
esac
fi
