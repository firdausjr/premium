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

IP=$(wget -qO- ipinfo.io/ip);
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Installed]${Font_color_suffix}"
Error="${Red_font_prefix}[Not Installed]${Font_color_suffix}"
cek=$(netstat -ntlp | grep 10000 | awk '{print $7}' | cut -d'/' -f2)

#list function
#=============
function install () {
IP=$(wget -qO- ifconfig.co);
echo " Adding Repositori Webmin"
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
apt install gnupg gnupg1 gnupg2 -y
wget -q http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
echo " Start Install Webmin"
sleep 0.5
apt update > /dev/null 2>&1
apt install webmin -y
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
/etc/init.d/webmin restart
rm -f /root/jcameron-key.asc
echo ""
echo "  ==========================="
echo "  ##  Done Install Webmin  ##"
echo "  ==========================="
echo "  You can login by user root in browser"
echo "  $IP:10000 "
echo ""
}
function restart () {
echo " Restarting Webmin"
sleep 0.5
service webmin restart > /dev/null 2>&1
echo "  Start Uninstall Webmin"
echo ""
echo "  Done Restart Webmin"
echo ""
}
function uninstall () {
echo "  Removing Repositori Webmin"
rm -f /etc/apt/sources.list.d/webmin.list
apt update > /dev/null 2>&1
echo "  Start Uninstall Webmin"
sleep 0.5
apt autoremove --purge webmin -y > /dev/null 2>&1
echo ""
echo "  Done Uninstall Webmin"
echo ""
}
if [[ "$cek" = "perl" ]]; then
sts="${Info}"
else
sts="${Error}"
fi

#Target
#===========================================================
echo -e "   # Status Webmin $sts"
echo -e "   ==========================" | lolcat
echo -e "    1. Install Webmin"
echo -e "    2. Restart Webmin"
echo -e "    3. Uninstall Webmin"
echo -e ""
echo -e "      [x] $(tput setaf 1)EXIT$(tput sgr 0)   |   [b] $(tput setaf 35)BACK$(tput sgr 0)"
echo -e ""
read -rp "        Choose what do you want :  " -e num
if [[ "$num" = "1" ]]; then
install
elif [[ "$num" = "2" ]]; then
restart
elif [[ "$num" = "3" ]]; then
uninstall
elif [[ "$num" = "b" ]]; then
menu
elif [[ "$num" = "x" ]]; then
exit
else
echo ""
echo "        $(tput setaf 1)You Entered The Wrong Number$(tput sgr 0)"
sleep 2
wbmn
fi