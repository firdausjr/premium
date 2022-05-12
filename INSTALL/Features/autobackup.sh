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
cek=$(grep -c -E "^# BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
function start() {
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "       Please enter your email for received file backed up!"
sleep 1
echo ""
read -rp "                         Email : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
cat << EOF >> /etc/crontab
# BEGIN_Backup
5 0 * * * root bckp
# END_Backup
EOF
echo service cron restart
echo "        Please Wait!"
sleep 2
echo "        $(tput setaf 2)Autobackup Has Been Started"
echo "        Data Will Be Backed Up Automatically at 00:05 GMT +7$(tput sgr 0)"
exit 0
}
function stop() {
email=$(cat /home/email)
sed -i "/^$email/d" /home/email
sed -i "/^# BEGIN_Backup/,/^# END_Backup/d" /etc/crontab
service cron restart
sleep 1
echo "        Please Wait"
echo "        $(tput setaf 1)Autobackup Has Been Stopped!$(tput sgr 0)"
exit 0
}
echo -e "      -=Status Autobackup Data $sts=-"
echo -e "══════════════════════════════════════════════════════════════════════════════════════" | lolcat
echo -e "    1. Start Autobackup     2. Stop Autobackup     |     {b}$(tput setaf 2)BACK$(tput sgr 0)        {x}$(tput setaf 1)EXIT$(tput sgr 0)"
echo -e ""
read -rp "        What are you want : " -e num
case $num in
	1)
	start
	;;
	2)
	stop
	;;
	b | B | Back | back)
	menu
	;;
	x)
	HOME
	;;
	echo ""
	echo "        $(tput setaf 1)You Entered The Wrong Number!$(tput sgr 0)"
	sleep 2
	autobackup
esac
