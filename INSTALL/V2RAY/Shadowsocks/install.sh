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
  rm -f sodosok.sh sodosok
  exit 1
  fi

cd && clear
#shadowsocks-libev obfs install by Days
source /etc/os-release
OS=$ID
ver=$VERSION_ID

#Install_Packages
echo "#############################################"
echo "Installing Packet . . ."
apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake -y
echo "Packet installed . . ."
echo "#############################################"


#Install_Shadowsocks_libev
echo "#############################################"
echo "Install Shadowsocks-libev..."
apt-get install software-properties-common -y
if [[ $OS == 'ubuntu' ]]; then
    apt install shadowsocks-libev -y
    apt install simple-obfs -y
elif [[ $OS == 'debian' ]]; then
    if [[ "$ver" = "9" ]]; then
    echo "deb http://deb.debian.org/debian stretch-backports main" | tee /etc/apt/sources.list.d/stretch-backports.list
    apt update
    apt -t stretch-backports install shadowsocks-libev -y
    apt -t stretch-backports install simple-obfs -y
    elif [[ "$ver" = "10" ]]; then
    echo "deb http://deb.debian.org/debian buster-backports main" | tee /etc/apt/sources.list.d/buster-backports.list
    apt update
    apt -t buster-backports install shadowsocks-libev -y
    apt -t buster-backports install simple-obfs -y
    fi
fi
echo "Install Shadowsocks-libev Done."
echo "#############################################"

#Server Configurations
echo "#############################################"
echo "Configurations Server."
cat > /etc/shadowsocks-libev/config.json <<END
{   
    "server":"0.0.0.0",
    "server_port":8488,
    "password":"tes",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
}
END
echo "#############################################"

#Start ~shadowsocks-libev~ server
echo "#############################################"
echo "Starting shadowsocks server"
systemctl enable shadowsocks-libev.service
systemctl start shadowsocks-libev.service
echo "#############################################"

#Making client config
echo "#############################################"
echo "Making config obfs"
cat > /etc/shadowsocks-libev.json <<END
{
    "server":"127.0.0.1",
    "server_port":8388,
    "local_port":1080,
    "password":"",
    "timeout":60,
    "method":"chacha20-ietf-poly1305",
    "mode":"tcp_and_udp",
    "fast_open":true,
    "plugin":"/usr/bin/obfs-local",
    "plugin_opts":"obfs=tls;failover=127.0.0.1:1443;fast-open"
}
END
chmod +x /etc/shadowsocks-libev.json
echo "#############################################"

echo -e "">>"/etc/shadowsocks-libev/akun.conf"

echo "#############################################"
echo "Adding features Shadowsocks-libev"
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2443:3543 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2443:3543 -j ACCEPT
iptables-save > /etc/iptables.up.rules
ip6tables-save > /etc/ip6tables.up.rules

wget -qO /usr/bin/add-ss ${server_owner}/INSTALL/V2RAY/Shadowsocks/add-ss.sh && chmod +x /usr/bin/add-ss
wget -qO /usr/bin/del-ss ${server_owner}/INSTALL/V2RAY/Shadowsocks/del-ss.sh && chmod +x /usr/bin/del-ss
wget -qO /usr/bin/cek-ss ${server_owner}/INSTALL/V2RAY/Shadowsocks/cek-ss.sh && chmod +x /usr/bin/cek-ss
wget -qO /usr/bin/renew-ss ${server_owner}/INSTALL/V2RAY/Shadowsocks/renew-ss.sh && chmod +x /usr/bin/renew-ss
rm -f /root/sodosok.sh
clear