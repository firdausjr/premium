#!/bin/bash
server_owner=https://raw.githubusercontent.com/firdausjr/premium/main # Information owner this script

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

# Detect a problem
  if [[ -e /etc/debian_version ]]; then
  OS=debian
  RCLOCAL='/etc/rc.local'
  elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
  OS=centos
  RCLOCAL='/etc/rc.d/rc.local'
  chmod +x /etc/rc.d/rc.local
  else
  echo ""
  echo ""
  echo "   Im Sorry, We Are Maintancing This AutoScript for Many Times,"
  echo "   Please Wait For NEW Realease!"
  echo ""
  exit
  fi

# Info VPS
  ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
  CITY=$(curl -s ipinfo.io/city)
  WKT=$(curl -s ipinfo.io/timezone)
  IPVPS=$(curl -s ipv4.icanhazip.com)
  cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
  cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
  freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
  tram=$( free -m | awk 'NR==2 {print $2}' )
  up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

# Check domain
  source /var/lib/premium-script/ipvps.conf
  if [[ $IP == "" ]]; then
  domain=$(cat /etc/v2ray/domain)
  else
  domain=$IP
  fi

  clear

# Screen
  figlet "  AUTOSCRIPT.NET" | lolcat
  echo "$(tput setaf 8)#By Firdaus project <?>$(tput sgr 0)"
  echo "---------------------------------------------------------------------------------------" | lolcat
  echo "  <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <>  " | lolcat
  echo "---------------------------------------------------------------------------------------" | lolcat
  echo ""
  echo "                              -=ACCESS LOGIN BY ROOT=-"
  echo "                    -=THIS IS AN INFORMATION ABOUT YOUR SERVER=-"
  echo "======================================================================================" | lolcat
  echo ""
  echo -e "    \e[033;1mIP SERVER               :    \e[0m  $IPVPS"
  echo -e "    \e[033;1mHOST DOMAIN             :    \e[0m  $domain"
  echo -e "    \e[032;1mISP Name                :    \e[0m  $ISP - $CITY"
  echo -e "    \e[032;1mCPU Name                :   \e[0m  $cname"
  echo -e "    \e[032;1mCPU Info                :    \e[0m  $cores cores $freq MHz"
  echo -e "    \e[032;1mTotal Amount Of RAM     :    \e[0m  $tram MB"
  echo -e "    \e[032;1mSystem Uptime           :  \e[0m  $up"
  echo ""
  echo "$(tput setaf 8)--------------------------------------------------------------------------------------$(tput sgr 0)"
  echo ""
  echo "                              -=THIS ARE MENU LIST VPN=-"
  echo "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
  echo ""
  echo "         1.  Control Panel SSH & OVPN"
  echo "                                           5.  Control Panel SSR & Shadowsocks"
  echo "         2.  Control Panel Wireguard"
  echo "                                           6.  Control Panel Vmess/V2ray"
  echo "         3.  Control Panel L2TP & PPTP"
  echo "                                           7.  Control Panel Vless"
  echo "         4.  Control Panel SSTP"
  echo "                                           8.  Control Panel Trojan"
  echo ""
  echo "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
  echo ""
  echo "       {s}  $(tput setaf 2)SETTING  / MANAGE YOUR VPS$( tput sgr 0)    {x}  $(tput setaf 1)EXIT FROM THIS MENU / TERMINAL$(tput sgr 0)"
  echo ""
  read -p "     Choose what do you want :  "  num
  echo ""
  case $num in
  1)
  tessh
  ;;
  2)
  wgg
  ;;
  3)
  ltp
  ;;
  4)
  ssstp
  ;;
  5)
  sssr
  ;;
  6)
  wss
  ;;
  7)
  vls
  ;;
  8)
  trj
  ;;
  s)
  settings
  ;;
  x)
  HOME
  ;;
  *)
  echo "     $(tput setaf 1)Please enter a correct number!$(tput sgr 0)"
  sleep 3
  menu
  ;;
  esac
