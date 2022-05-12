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
  rm -f cdn.sh cdn
  exit 1
  fi

cd && clear
mkdir /etc/CDN

# Install Template
wget -qO /etc/CDN/ws-openssh ${server_owner}/INSTALL/SSH-OVPN/CDN/ws-openssh.py && chmod +x /etc/CDN/ws-openssh
wget -qO /etc/CDN/ws-openvpn ${server_owner}/INSTALL/SSH-OVPN/CDN/ws-ovpn.py && chmod +x /etc/CDN/ws-openvpn
wget -qO /etc/CDN/ws-dropbear ${server_owner}/INSTALL/SSH-OVPN/CDN/ws-dropbear.py && chmod +x /etc/CDN/ws-dropbear
wget -qO /etc/CDN/ws-stunnel4 ${server_owner}/INSTALL/SSH-OVPN/CDN/ws-tls.py && chmod +x /etc/CDN/ws-stunnel4

# Dropbear
cat > /etc/systemd/system/ws-dropbear.service << END
[Unit]
Description=SSH Over CDN WS Dropbear
Documentation=https://project.days.my.id
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/CDN/ws-dropbear
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# OpenSSH
cat > /etc/systemd/system/ws-openssh.service << END
[Unit]
Description=SSH Over CDN WS Dropbear
Documentation=https://project.days.my.id
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/CDN/ws-openssh
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# OpenVPN
cat > /etc/systemd/system/ws-openvpn.service << END
[Unit]
Description=SSH Over CDN WS OpenVPN
Documentation=https://project.days.my.id
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/CDN/ws-openvpn
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# Stunnel4
cat > /etc/systemd/system/ws-stunnel4.service << END
[Unit]
Description=SSH Over CDN WS Stunnel4
Documentation=https://project.days.my.id
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/CDN/ws-stunnel4
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# Exec Start
systemctl daemon-reload

# Enabling
systemctl enable ws-dropbear.service
systemctl enable ws-openssh.service
systemctl enable ws-openvpn.service
systemctl enable ws-stunnel4.service

# Restarting
systemctl restart ws-dropbear.service
systemctl restart ws-openssh.service
systemctl restart ws-openvpn.service
systemctl restart ws-stunnel4.service

#BadVPN WS
wget -q ${server_owner}/INSTALL/SSH-OVPN/CDN/badvpn-cdn.zip && unzip badvpn-cdn.zip && rm -f badvpn-cdn.zip
cd badvpn-master
mkdir build
cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
sudo make install

# Install Module
apt install dnsutils jq -y
apt-get install net-tools -y
apt-get install tcpdump -y
apt-get install dsniff -y
apt install grepcidr -y

cd
rm -rf badvpn-master
rm -f cdn.sh
clear