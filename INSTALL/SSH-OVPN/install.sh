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
  rm -f ssh-vpn.sh ssh-vpn
  exit 1
  fi

cd && clear
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

# Detail name organization
country=ID
state=Indonesia
locality=Indonesia
organization=https://project.days.my.id
organizationalunit=https://google.com
commonname=anonyzer
email=shantree.anonyzer01@gmail.com

# Simple password minimal
wget -qO /etc/pam.d/common-password "${server_owner}/INSTALL/SSH-OVPN/password" && chmod +x /etc/pam.d/common-password

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
clear

# update
echo "{$(tput setaf 2) UPDATING $(tput sgr 0)} >> Package Needed"
sleep 3 && clear
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
clear

# Checking error install package
echo "{$(tput setaf 2) CHECKING $(tput sgr 0)} >> Reinstall Package"
sleep 3 && clear
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
clear

# install webserver for config ovpn
echo "{$(tput setaf 2)INSTALLING$(tput sgr 0)} >> Webserver Nginx"
sleep 3 && clear
wget -qO /root/webserver.sh ${server_owner}/INSTALL/Webserver/install.sh && chmod +x webserver.sh && ./webserver.sh && rm -f /root/webserver.sh

# Check webserver
web=$(systemctl status nginx | grep -i "active (running)")
if [[ "$web" == "" ]]; then
echo "{$(tput setaf 1) SORRY $(tput sgr 0)} >> Webserver nginx is NOT installed"
else
echo "{$(tput setaf 2) DONE $(tput sgr 0)} >> Webserver nginx is installed"
fi
sleep 2 && clear

# install badvpn
echo "{$(tput setaf 2) INSTALLING $(tput sgr 0)} >> BADVPN / UDPGW-64"
sleep 3 && clear
wget -qO /usr/bin/badvpn-udpgw ${server_owner}/INSTALL/SSH-OVPN/badvpn-udpgw64 && chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
clear

# Installing service
echo "{$(tput setaf 2) INSTALLING $(tput sgr 0)} >> Dropbear - Squid - Vnstat - Stunnel4 - OVPN - Fail2ban"
sleep 3 && clear

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# Check dropbear
drop=$(systemctl status dropbear | grep -i "active (running)")
if [[ "$drop" == "" ]]; then
echo "{$(tput setaf 1) SORRY $(tput sgr 0)} >> Dropbear is NOT installed"
else
echo "{$(tput setaf 2) DONE $(tput sgr 0)} >> Dropbear is installed"
fi
sleep 2 && clear

# install squid3
apt -y install squid3
wget -qO /etc/squid/squid.conf "${server_owner}/INSTALL/SSH-OVPN/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf
systemctl start squid

# Check squid proxy
squid=$(systemctl status squid | grep -i "active (running)")
if [[ "$squid" == "" ]]; then
echo "{$(tput setaf 1) SORRY $(tput sgr 0)} >> Squid proxy is NOT installed"
else
echo "{$(tput setaf 2) DONE $(tput sgr 0)} >> Squid proxy is installed"
fi
sleep 2 && clear

# setting vnstat
apt -y install vnstat
systemctl restart vnstat
apt -y install libsqlite3-dev
wget -q https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# Check vnstat
vnstat=$(systemctl status vnstat | grep -i "active (running)")
if [[ "$vnstat" == "" ]]; then
echo "{$(tput setaf 1) SORRY $(tput sgr 0)} >> VNSTAT is NOT installed"
else
echo "{$(tput setaf 2) DONE $(tput sgr 0)} >> VNSTAT is installed"
fi
sleep 2 && clear

# install stunnel4
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[stunnel4]
accept = 442
connect = 127.0.0.1:109

[ws-stunnel4]
accept = 2021
connect = 127.0.0.1:443

[openvpn]
accept = 8442
connect = 127.0.0.1:1194

END

#Forward 443 with SSLH Service
apt-get install sslh -y
wget -qO /etc/default/sslh ${server_owner}/INSTALL/SSH-OVPN/sslh.conf
service sslh restart

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# Configurations stunnel4
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

# Check Stunnel4
ssl=$(systemctl status stunnel4 | grep -i "active (running)")
if [[ "$ssl" == "" ]]; then
echo "{$(tput setaf 1) SORRY $(tput sgr 0)} >> Stunnel4 is NOT installed"
else
echo "{$(tput setaf 2) DONE $(tput sgr 0)} >> Stunnel4 is installed"
fi
sleep 2 && clear

# Installing OpenVPN
wget -qO vpn.sh ${server_owner}/INSTALL/SSH-OVPN/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# Check OpenVPN
ovpn=$(systemctl status openvpn | grep -i "active (exited)")
if [[ "$ovpn" == "" ]]; then
echo "{$(tput setaf 1) SORRY $(tput sgr 0)} >> OpenVPN is NOT installed"
else
echo "{$(tput setaf 2) DONE $(tput sgr 0)} >> OpenVPN is installed"
fi
sleep 2 && clear

# install fail2ban
apt -y install fail2ban
systemctl restart fail2ban

# Check fail2ban
fail2ban=$(systemctl status fail2ban | grep -i "active (running)")
if [[ "$fail2ban" == "" ]]; then
echo "{$(tput setaf 1) SORRY $(tput sgr 0)} >> Fail2ban is NOT installed"
else
echo "{$(tput setaf 2) DONE $(tput sgr 0)} >> Fail2ban is installed"
fi
sleep 2 && clear

# Instal DDOS DEFlate
echo "{$(tput setaf 2)INSTALLING$(tput sgr 0)} >> DDOS Deflate - firewall system from bruteforce"
sleep 3 && clear
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "        $(tput setaf 1)Please uninstall the previous version first!$(tput sgr 0)"
	sleep 3
	exit 0
else
	mkdir /usr/local/ddos
	echo; echo 'Installing DOS-Deflate 0.6'; echo
	echo; echo -n 'Downloading source files...'
	wget -qO /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
	echo -n '.'
	wget -qO /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
	echo -n '.'
	wget -qO /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
	echo -n '.'
	wget -qO /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
	chmod 0755 /usr/local/ddos/ddos.sh
	cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
	echo '...done'
	echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
	/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
	echo '.....done'
	echo; echo 'Installation has completed.'
	echo 'Config file is at /usr/local/ddos/ddos.conf'
	echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
fi
cd && clear

# banner /etc/issue.net
wget -qO /etc/issue.net "${server_owner}/INSTALL/SSH-OVPN/issue.net"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
cd && clear

# block for user torrent
echo "{$(tput setaf 2) BLOCKING USER TORRENT $(tput sgr 0)} >> why ?"
echo "Thats are the bitch people can be slowly and crash your server"
sleep 5 && clear

iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# Download features
wget -qO /usr/bin/tessh ${server_owner}/INSTALL/SSH-OVPN/menu.sh && chmod +x /usr/bin/tessh
wget -qO /usr/bin/usernew ${server_owner}/INSTALL/SSH-OVPN/usernew.sh && chmod +x /usr/bin/usernew
wget -qO /usr/bin/trial ${server_owner}/INSTALL/SSH-OVPN/trial.sh && chmod +x /usr/bin/trial
wget -qO /usr/bin/member ${server_owner}/INSTALL/SSH-OVPN/member.sh && chmod +x /usr/bin/member
wget -qO /usr/bin/hapus ${server_owner}/INSTALL/SSH-OVPN/hapus.sh && chmod +x /usr/bin/hapus
wget -qO /usr/bin/delete ${server_owner}/INSTALL/SSH-OVPN/delete.sh && chmod +x /usr/bin/delete
wget -qO /usr/bin/cek ${server_owner}/INSTALL/SSH-OVPN/cek.sh && chmod +x /usr/bin/cek
wget -qO /usr/bin/renew ${server_owner}/INSTALL/SSH-OVPN/renew.sh && chmod +x /usr/bin/renew
wget -qO /usr/bin/autokill ${server_owner}/INSTALL/SSH-OVPN/autokill.sh && chmod +x /usr/bin/autokill
wget -qO /usr/bin/ceklim ${server_owner}/INSTALL/SSH-OVPN/ceklim.sh && chmod +x /usr/bin/ceklim
wget -qO /usr/bin/tendang ${server_owner}/INSTALL/SSH-OVPN/tendang.sh && chmod +x /usr/bin/tendang
wget -qO /usr/bin/restart-ssh ${server_owner}/INSTALL/SSH-OVPN/restart-ssh.sh && chmod +x /usr/bin/restart-ssh

echo "unset HISTFILE" >> /etc/profile

# remove unnecessary files
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-ovpn.sh
history -c
clear
