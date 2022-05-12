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
  rm -rf patch patch.sh
  exit 1
  fi

# Menu - Settings
wget -qO /usr/bin/HOME ${server_owner}/INSTALL/Features/HOME.sh && chmod +x /usr/bin/HOME
wget -qO /usr/bin/menu ${server_owner}/INSTALL/Features/menu.sh && chmod +x /usr/bin/menu
wget -qO /usr/bin/settings ${server_owner}/INSTALL/Features/settings.sh && chmod +x /usr/bin/settings

#Feature system
wget -qO /usr/bin/ram ${server_owner}/INSTALL/Features/ram.sh && chmod +x /usr/bin/ram
wget -qO /usr/bin/wbmn ${server_owner}/INSTALL/Features/webmin.sh && chmod +x /usr/bin/wbmn
wget -qO /usr/bin/about ${server_owner}/INSTALL/Features/about.sh && chmod +x /usr/bin/about
wget -qO /usr/bin/status ${server_owner}/INSTALL/Features/status.sh && chmod +x /usr/bin/status
wget -qO /usr/bin/restart ${server_owner}/INSTALL/Features/restart.sh && chmod +x /usr/bin/restart
wget -qO /usr/bin/add-host ${server_owner}/INSTALL/Features/add-host.sh && chmod +x /usr/bin/add-host
wget -qO /usr/bin/auto-reboot ${server_owner}/INSTALL/Features/auto-reboot.sh && chmod +x /usr/bin/auto-reboot
wget -qO /usr/bin/speedtest ${server_owner}/INSTALL/Features/speedtest_cli.py && chmod +x /usr/bin/speedtest

rm -f patch.sh patch