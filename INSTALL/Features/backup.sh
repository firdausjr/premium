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

echo -e " BACKUP YOUR DATA VPS & ACCOUNT VPN FROM SERVER"
echo -e ""
echo -e "           Enter Your Email To Receive Data BackedUp!"
read -rp "                         Your Email : " -e email
sleep 1
echo ""
echo -e "          Making Directory BackUp. . . . . > /root/backup"
mkdir /root/backup
sleep 1
echo Start Backup . . . . .
sleep 2
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/
cp /etc/ppp/chap-secrets backup/
cp /etc/ipsec.d/passwd backup/
cp /etc/shadowsocks-libev/akun.conf backup/
cp -r /var/lib/premium-script/ backup/
cp -r /home/sstp backup/
cp -r /etc/v2ray backup/
cp -r /etc/trojan backup/
cp -r /usr/local/shadowsocksr/ backup/
cp -r /home/vps/public_html backup/
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "The following is a link to your vps data backup file.

Your VPS IP $IP

$link

If you want to restore data, please enter the link above.

Thank You For Using Our Services.
"Days-Project @2021" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo "         Done"
sleep 2
echo "         Please Check Your Email"
echo " "