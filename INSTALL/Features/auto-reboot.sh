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

echo " #System Auto Reboot=-"
echo "-------------------------------------------"
echo "   1.  Set Auto-Reboot every 1 Hour"
echo "   2.  Set Auto-Reboot every 6 Hour"
echo "   3.  Set Auto-Reboot every 12 Hour"
echo "   4.  Set Auto-Reboot every 1 Day"
echo "   5.  Set Auto-Reboot every 1 Tweek"
echo "   6.  Set Auto-Reboot every 1 Month"
echo "   7.  OFF the system Auto-Reboot"
echo "   8.  View auto reboot log"
echo "   9.  Remove auto reboot log"
echo "-------------------------------------------"
echo ""
read -p "   Select options from (1-9): " x
echo ""
case $x in
1)
echo "10 * * * * root /usr/bin/auto_reboot" > /etc/cron.d/auto_reboot
echo "   Auto-Reboot has been set every an hour."
echo ""
;;
2)
echo "10 */6 * * * root /usr/bin/auto_reboot" > /etc/cron.d/auto_reboot
echo "   Auto-Reboot has been successfully set every 6 hours."
echo ""
;;
3)
echo "10 */12 * * * root /usr/bin/auto_reboot" > /etc/cron.d/auto_reboot
echo "   Auto-Reboot has been successfully set every 12 hours."
echo ""
;;
4)
echo "10 0 * * * root /usr/bin/auto_reboot" > /etc/cron.d/auto_reboot
echo "   Auto-Reboot has been successfully set once a day."
echo ""
;;
5)
echo "10 0 */7 * * root /usr/bin/auto_reboot" > /etc/cron.d/auto_reboot
echo "   Auto-Reboot has been successfully set once a week."
echo ""
;;
6)
echo "10 0 1 * * root /usr/bin/auto_reboot" > /etc/cron.d/auto_reboot
echo "   Auto-Reboot has been successfully set once a month."
echo ""
;;
7)
rm -f /etc/cron.d/auto_reboot
echo "   Auto-Reboot successfully TURNED OFF."
echo ""
;;
8)
if [ ! -e /root/log-autoreboot.txt ]; then
	echo "   No reboot activity found"
	else
	echo ""
	cat /root/log-autoreboot.txt
	echo ""
fi
;;
9)
rm -f /root/log-autoreboot.txt
echo ""
echo "   Auto Reboot Log successfully deleted!"
echo ""
;;
*)
echo "   Options Not Found In Menu"
sleep 3
clear && auto-reboot
;;
esac
