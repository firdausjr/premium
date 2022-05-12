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
  echo "   YOU DONT HAVE ACCESS TO RUN THIS SCRIPT"
  echo ""
  echo "   THIS OWNER CONTACT   > WHATSAPP : +6282232547380"
  echo "                        > TELEGRAM : @FirdauzVpn"
  echo "                        > EMAIL    : mobilemvp99@gmail.com"
  echo ""
  echo "   THIS CREATOR CONTACT > WHATSAPP : +6287891876989"
  echo "                        > TELEGRAM : @DaysVPN"
  echo "                        > EMAIL    : shantree.anonyzer01@gmail.com"
  echo ""
  rm -rf cloudflare cloudflare.sh
  exit 1
  fi

apt install jq curl -y
clear
figlet Firdaus project | lolcat
echo ""
echo "   We provide three (3) domains for you,"
echo "   including > premium.firdausjr.xyz"
echo "             > days.vmess.my.id"
echo "             > premium.days.my.id"
echo ""
echo "       Please choose your like!"
echo ""
echo "       1. Request sub from domain premium.firdausjr.xyz"
echo "       2. {random}.premium.firdausjr.xyz"
echo ""
echo "       3. Request sub from domain days.vmess.my.id"
echo "       4. {random}.days.vmess.my.id"
echo ""
echo "       5. Request sub from domain premium.days.my.id"
echo "       6. {random}.premium.days.my.id"
echo ""
read -rp "          Choose : " choose

if [[ "$choose" = "1" ]]; then
        DOMAIN=firdausjr.xyz
        CF_ID=mobilemvp99@gmail.com
        CF_KEY=a2466bd0cd7710d2dcd4ad9d8629f536c6a1e
        read -rp "     Request sub : " req
        SUB_DOMAIN=${req}.premium.firdausjr.xyz

elif [[ "$choose" = "2" ]]; then
        DOMAIN=firdausjr.xyz
        CF_ID=mobilemvp99@gmail.com
        CF_KEY=a2466bd0cd7710d2dcd4ad9d8629f536c6a1e
        sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
        SUB_DOMAIN=${sub}.premium.firdausjr.xyz

elif [[ "$choose" = "3" ]]; then
        DOMAIN=vmess.my.id
        CF_ID=pradiasangindraswari@gmail.com
        CF_KEY=75b54a5c9fd50751003abac0fefee534528c0
        read -rp "     Request sub : " req
        SUB_DOMAIN=${req}.days.vmess.my.id

elif [[ "$choose" = "4" ]]; then
        DOMAIN=vmess.my.id
        CF_ID=pradiasangindraswari@gmail.com
        CF_KEY=75b54a5c9fd50751003abac0fefee534528c0
        sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
        SUB_DOMAIN=${sub}.days.vmess.my.id

elif [[ "$choose" = "5" ]]; then
        DOMAIN=days.my.id
        CF_ID=shantree.anonyzer01@gmail.com
        CF_KEY=3afc1095369277df9639b21ce6f65763d5b89
        read -rp "     Request sub : " req
        SUB_DOMAIN=${req}.premium.days.my.id

elif [[ "$choose" = "6" ]]; then
        DOMAIN=days.my.id
        CF_ID=shantree.anonyzer01@gmail.com
        CF_KEY=3afc1095369277df9639b21ce6f65763d5b89
        sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
        SUB_DOMAIN=${sub}.premium.days.my.id

elif [[ "$choose" = "" ]]; then
	echo ""
	echo "      $(tput setaf 1)You no entered number , so please adding subdomain to manually$(tput sgr 0)"
	echo ""
	rm -f cloudflare.sh
	sleep 3
	exit 1

else
	echo ""
	echo "      $(tput setaf 1)You no entered number , so please adding subdomain to manually$(tput sgr 0)"
	echo ""
	sleep 3
	rm -f cloudflare.sh
	exit 1
fi
echo ""
echo ""
set -euo pipefail
IP=$(wget -qO- ipinfo.io/ip);
echo "          $(tput setaf 2)Updating DNS for ${SUB_DOMAIN} in cloudflare. . .$(tput sgr 0)"
sleep 3
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')

echo ""
echo "          Host : $SUB_DOMAIN"
echo ""
echo "$SUB_DOMAIN" > /root/domain
echo "          We are save in folder /etc/v2ray/domain"
sleep 3
rm -f cloudflare.sh
clear
