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

curl -s https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -qO /root/.config/rclone/rclone.conf "${server_owner}/INSTALL/Features/rclone.conf"
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat > /etc/msmtprc <<EOF
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user pradiasangindraswari@gmail.com
from pradiasangindraswari@gmail.com
password ybkehwuifdgvgiiq
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc

# Download features
wget -qO /usr/bin/autobackup ${server_owner}/INSTALL/Features/autobackup.sh && chmod +x /usr/bin/autobackup
wget -qO /usr/bin/backup ${server_owner}/INSTALL/Features/backup.sh && chmod +x /usr/bin/backup
wget -qO /usr/bin/bckp ${server_owner}/INSTALL/Features/bckp.sh && chmod +x /usr/bin/bckp
wget -qO /usr/bin/restore ${server_owner}/INSTALL/Features/restore.sh && chmod +x /usr/bin/restore
wget -qO /usr/bin/strt ${server_owner}/INSTALL/Features/strt.sh && chmod +x /usr/bin/strt

rm -f /root/set-br.sh
clear