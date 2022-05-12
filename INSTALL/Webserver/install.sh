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
  rm -f webserver.sh webserver
  exit 1
  fi

cd && clear
# install webserver nginx
apt -y install nginx

# Creating server public
mkdir -p /home/vps/public_html

# Delete config default nginx
rm -f /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

# Download config nginx
wget -qO /etc/nginx/nginx.conf "${server_owner}/INSTALL/Webserver/nginx.conf"
wget -qO /etc/nginx/conf.d/vps.conf "${server_owner}/INSTALL/Webserver/vps.conf"

# Restarting nginx service
/etc/init.d/nginx restart

rm -f nginx.sh nginx
