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

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
figlet "  AUTOSCRIPT.NET" | lolcat
echo -e "$(tput setaf 8)#By Firdaus project <?> $(tput sgr 0)"
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e " <> SSH & OVPN <> ALL VPN <> WEBMIN | MANUAL <> TOOLS HACKING <> CREDIT CARD VULN <> " | lolcat
echo -e "-------------------------------------------------------------------------------------" | lolcat
echo -e ""
echo -e ""
echo -e ""
echo -e "     -=Status Auto Kill $sts=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "        1.  AutoKill After 5 Minutes"
echo -e "                                           3.  AutoKill After 15 Minutes"
echo -e "        2.  AutoKill After 10 Minutes"
echo -e "                                           4.  Turn Off AutoKill/MultiLogin"
echo -e ""
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e ""
echo -e "                              [x]  $(tput setaf 1)EXIT$(tput sgr 0)    |    [b]  $(tput setaf 2)BACK$(tput sgr 0)"
echo -e ""
read -p "       What do you want from this menu      :  " AutoKill
case $AutoKill in
                1)
                read -p "       Multilogin Maximum Number Of Allowed :  " max
                echo -e ""
                sleep 2
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 5 Minutes"      
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""                                                               
                ;;
                2)
                read -p "       Multilogin Maximum Number Of Allowed :  " max
                echo -e ""
                sleep 2
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 10 Minutes"
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""
                ;;
                3)
                read -p "       Multilogin Maximum Number Of Allowed :  " max
                echo -e ""
                sleep 2
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 15 Minutes"
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""
                ;;
                4)
                echo -e ""
                sleep 2
                echo > /etc/cron.d/tendang
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""
                echo -e "      AutoKill MultiLogin Turned Off  "
                echo -e ""
                echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
                echo -e ""
                ;;
		b)
		menu
                ;;
                x)
                HOME
                ;;
esac
