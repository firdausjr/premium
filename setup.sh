#!/bin/bash
#Autoscript By Days-Project

#Information owner this autoscript
server_owner=https://raw.githubusercontent.com/firdausjr/premium/main

#Detect User Root or Not
if [ "${EUID}" -ne 0 ]; then
echo ""
echo "    $(tput setaf 1)You need to run this script as root!$(tput sgr 0)"
echo ""
rm -f setup.sh
exit 1
fi

#Detect Openvz
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo ""
echo "    $(tput setaf 1)OpenVZ is not supported!$(tput sgr 0)"
echo ""
rm -f setup.sh
exit 1
fi

#Detect Installed Autoscript
if [ -f "/etc/v2ray/domain" ]; then
echo ""
echo "    $(tput setaf 2)Script Already Installed!$(tput sgr 0)"
echo ""
rm -f setup.sh
exit 1
fi

#Settings ipv6 to disabled
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1

#Install software needed
apt update -y && apt install -y bzip2 gzip coreutils screen curl ruby figlet lolcat mc && gem install lolcat
cd && clear

#Verify Premium User
 figlet "Firdaus project" | lolcat
 echo ""
 echo "    TO INSTAL AND USE OUR FEATURES A LICENCE IS REQUIRED!"
 echo ""
 echo "    NO HAVE YET ? "
 echo ""
 echo "    THIS OWNER CONTACT   > WHATSAPP : +6282232547380"
 echo "                         > TELEGRAM : @FirdauzVpn"
 echo "                         > EMAIL    : mobilemvp99@gmail.com"
 echo ""
 echo "    THIS CREATOR CONTACT > WHATSAPP : +6287891876989"
 echo "                         > TELEGRAM : @DaysVPN"
 echo "                         > EMAIL    : shantree.anonyzer01@gmail.com"
 echo ""
 echo ""
 read -rp "    YOUR LICENSE  : " Premium
 echo ""
 sleep 1

 #Insert licence is required
 if [ "$Premium" == "" ]; then
 echo "         $(tput setaf 1)PLEASE INSERT YOUR LICENCE!$(tput sgr 0)"
 echo ""
 rm -f setup.sh
 exit 1
 fi

 #IPVPS
 IPVPS=$(curl -s ipv4.icanhazip.com)

 #LICENCE
 licence=$(curl -s ${server_owner}/Autoscript/licence | grep ${Premium} | cut -d ' ' -f 1)
 if [ "${Premium}" == "${licence}" ]; then
 echo "         $(tput setaf 2)LICENCE IS ACCEPTED$(tput sgr 0)"
 sleep 1
 installed_autoscript=$(date +"%A, %d - %B - %Y")
 expired_autoscript=$(curl -s ${server_owner}/Autoscript/member_premium | grep ${IPVPS} | cut -d ' ' -f 2-7)

 #Check permision access
 IZIN=$(curl -s ${server_owner}/Autoscript/member_premium | grep ${IPVPS} | cut -d ' ' -f 1)
 if [[ $IPVPS = $IZIN ]]; then
 echo ""
 else
 sleep 1
 echo ""
 echo "         $(tput setaf 1)BUT YOU DONT HAVE ACCESS TO INSTALL THIS AUTOSCRIPT$(tput sgr 0)"
 echo ""
 rm -f setup.sh
 exit 1
 fi

 else
 echo "         $(tput setaf 1)LICENCE IS NOT VERIFIED, PLEASE CONTACT MY BOSS!$(tput sgr 0)"
 echo ""
 rm -f setup.sh
 exit 1
 fi

cd && clear

#Starting instalation Autoscript
figlet "Firdaus project" | lolcat
echo ""
echo " don't exit this terminal, and let it connect to the internet until the installation process is complete!"
echo ""
secs=$((15))
while [ $secs -gt -1 ]; do
   echo -ne " autoscript installation will start in { $(tput setaf 2)${secs}$(tput sgr 0) } seconds . . .\033[0K\r"
   sleep 1
   : $((secs--))
done

#MIT LICENCE (TOS)
wget -qO /root/TOS ${server_owner}/TOS
cd && clear

#Adding subdomain
echo "{$(tput setaf 2)STEP 1$(tput sgr 0)} >> Adding Subdomain"
sleep 3 && clear
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
wget -qO /root/cloudflare.sh ${server_owner}/INSTALL/Features/cloudflare.sh && chmod +x cloudflare.sh && ./cloudflare.sh && rm -f /root/cloudflare.sh
cd && clear

#install SSH & OVPN
echo "{$(tput setaf 2)STEP 2$(tput sgr 0)} >> install SSH & OVPN"
sleep 3 && clear
wget -qO /root/ssh-ovpn.sh ${server_owner}/INSTALL/SSH-OVPN/install.sh && chmod +x ssh-ovpn.sh && screen -S ssh-ovpn ./ssh-ovpn.sh && rm -f /root/ssh-ovpn.sh
cd && clear

#install SSH & OVPN CDN
echo "{$(tput setaf 2)STEP 3$(tput sgr 0)} >> install SSH & OVPN CDN"
sleep 3 && clear
wget -qO /root/cdn.sh ${server_owner}/INSTALL/SSH-OVPN/CDN/install.sh && chmod +x cdn.sh && screen -S cdn ./cdn.sh && rm -f /root/cdn.sh
cd && clear

#install SSTP
echo "{$(tput setaf 2)STEP 4$(tput sgr 0)} >> install SSTP"
sleep 3 && clear
wget -qO /root/sstp.sh ${server_owner}/INSTALL/SSTP/install.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh && rm -f /root/sstp.sh
cd && clear

#install ShadowsocksR
echo "{$(tput setaf 2)STEP 5$(tput sgr 0)} >> install ShadowsocksR"
sleep 3 && clear
wget -qO /root/ssr.sh ${server_owner}/INSTALL/V2RAY/ShadowsocksR/install.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh && rm -f /root/ssr.sh
cd && clear

#install Shadowsocks
echo "{$(tput setaf 2)STEP 6$(tput sgr 0)} >> install Shadowsocks"
sleep 3 && clear
wget -qO /root/sodosok.sh ${server_owner}/INSTALL/V2RAY/Shadowsocks/install.sh && chmod +x sodosok.sh && screen -S sodosok ./sodosok.sh && rm -f /root/sodosok.sh
cd && clear

#install WIREGUARD
echo "{$(tput setaf 2)STEP 7$(tput sgr 0)} >> install WIREGUARD"
sleep 3 && clear
wget -qO /root/wg.sh ${server_owner}/INSTALL/Wireguard/install.sh && chmod +x wg.sh && screen -S wg ./wg.sh && rm -f /root/wg.sh
cd && clear

#install V2RAY
echo "{$(tput setaf 2)STEP 8$(tput sgr 0)} >> install V2RAY ( Trojan - Vmess - Vless )"
sleep 3 && clear
wget -qO /root/ins-vt.sh ${server_owner}/INSTALL/V2RAY/install.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh && rm -f /root/ins-vt.sh
cd && clear

#install IPSEC
echo "{$(tput setaf 2)STEP 9$(tput sgr 0)} >> install IPSEC"
sleep 3 && clear
wget -qO /root/ipsec.sh ${server_owner}/INSTALL/IPSEC/install.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh && rm -f /root/ipsec.sh
cd && clear

#install Trojan-Go
echo "{$(tput setaf 2)STEP 10$(tput sgr 0)} >> install TROJAN-GO"
sleep 3 && clear
wget -qO /root/ins-tr-go.sh ${server_owner}/INSTALL/V2RAY/Trojan-GO/install.sh && chmod +x ins-tr-go.sh && screen -S ins-tr-go ./ins-tr-go.sh && rm -f /root/ins-tr-go.sh
cd && clear

#Adding system backup and restore
echo "{$(tput setaf 2)STEP 11$(tput sgr 0)} >> install System Backup & Restore"
sleep 3 && clear
wget -qO /root/set-br.sh ${server_owner}/INSTALL/Features/set-br.sh && chmod +x set-br.sh && screen -S set-br ./set-br.sh && rm -f /root/set-br.sh
cd && clear

#Finishing
echo "$(tput setaf 2)FINISHING INSTALATION$(tput sgr 0)"
sleep 2
wget -qO /root/patch.sh ${server_owner}/INSTALL/Features/patch.sh && chmod +x patch.sh && ./patch.sh && rm -f /root/patch.sh

#Configuration Wellcome
wget -qO /root/.profile ${server_owner}/profile

#Getting file auto_reboot & auto delete user-expired
wget -qO /usr/bin/auto_reboot ${server_owner}/INSTALL/Features/auto_reboot.sh && chmod +x /usr/bin/auto_reboot
wget -qO /usr/bin/user-expired ${server_owner}/INSTALL/Features/user-expired.sh && chmod +x /usr/bin/user-expired

#Set auto reboot at 05:00 WIB - ASIA/JAKARTA
echo "0 5 * * * root /usr/bin/auto_reboot" > /etc/cron.d/auto_reboot

#Configuring auto delete expired user in every hours
echo "10 0 * * * root /usr/bin/user-expired" > /etc/cron.d/user-expired

#Version autoscript
echo "1.1" > /home/ver

clear

#Finished
figlet COMPLETED | lolcat
echo "Installation has been completed!!!"
sleep 2
clear

#Print & Save log-install.txt
echo "            Information installed your VPS with AutoScript By Firdaus!!"              | tee -a log-install.txt
echo "====================================================================================" | tee -a log-install.txt
echo ""                                                                                     | tee -a log-install.txt
echo "   >>> VPN SERVICES & PORT"                                                           | tee -a log-install.txt
echo "       - OpenSSH                      : 22 (default)"                                 | tee -a log-install.txt
echo "       - WebSocket openSSH            : 2082"                                         | tee -a log-install.txt
echo "       - Stunnel4                     : 442, 443"                                     | tee -a log-install.txt
echo "       - WebSocket stunnel4           : 443"                                          | tee -a log-install.txt
echo "       - Dropbear                     : 109, 143"                                     | tee -a log-install.txt
echo "       - WebSocket dropbear           : 2095"                                         | tee -a log-install.txt
echo "       - OpenVPN                      : TCP 1194, UDP 2200, SSL 8442"                 | tee -a log-install.txt
echo "       - WebSocket openVPN            : 2086"                                         | tee -a log-install.txt
echo "       - Squid Proxy                  : 3128, 8080 (limit to IP Server)"              | tee -a log-install.txt
echo "       - PPTP VPN                     : 1732"                                         | tee -a log-install.txt
echo "       - SSTP VPN                     : 447"                                          | tee -a log-install.txt
echo "       - Badvpn                       : 7100, 7200, 7300"                             | tee -a log-install.txt
echo "       - V2RAY Vmess TLS              : 8443"                                         | tee -a log-install.txt
echo "       - V2RAY Vmess None TLS         : 80"                                           | tee -a log-install.txt
echo "       - V2RAY Vless TLS              : 2083"                                         | tee -a log-install.txt
echo "       - V2RAY Vless None TLS         : 8880"                                         | tee -a log-install.txt
echo "       - Trojan                       : 2087"                                         | tee -a log-install.txt
echo "       - Trojan-GO                    : 2096"                                         | tee -a log-install.txt
echo "       - Wireguard                    : 7070"                                         | tee -a log-install.txt
echo "       - SS-OBFS TLS                  : 2443-2543"                                    | tee -a log-install.txt
echo "       - SS-OBFS HTTP                 : 3443-3543"                                    | tee -a log-install.txt
echo "       - Shadowsocks-R                : 1443-1543"                                    | tee -a log-install.txt
echo "       - Nginx                        : 18"                                           | tee -a log-install.txt
echo ""                                                                                     | tee -a log-install.txt
echo "   >>> INFORMATION VPS"                                                               | tee -a log-install.txt
echo "       - Timezone                     : Asia/Jakarta (GMT +7)"                        | tee -a log-install.txt
echo "       - IPv6                         : [OFF]"                                        | tee -a log-install.txt
echo "       - Fail2Ban                     : [ON]"                                         | tee -a log-install.txt
echo "       - DOS-flate                    : [ON]"                                         | tee -a log-install.txt
echo "       - IPtables                     : [ON]"                                         | tee -a log-install.txt
echo "       - Auto-Delete User Expired     : [ON]"                                         | tee -a log-install.txt
echo "       - Auto-Reboot                  : [ON] at 05:00 - Asia/Jakarta (GMT +7)"        | tee -a log-install.txt
echo ""                                                                                     | tee -a log-install.txt
echo "   >>> INFORMATION AUTOSCRIPT"                                                        | tee -a log-install.txt
echo "       - Your Licence                 : ${Premium}"                                   | tee -a log-install.txt
echo "       - Autoscript Installed at      : ${installed_autoscript}"                      | tee -a log-install.txt
echo "       - Autoscript Expired at        : ${expired_autoscript}"                        | tee -a log-install.txt
echo ""                                                                                     | tee -a log-install.txt
echo "====================================================================================" | tee -a log-install.txt

# Cleaning history
rm -f /root/setup.sh && rm -f setup.sh
history -c

# Rebooting system is required
echo ""
secs=$((15))
while [ $secs -gt -1 ]; do
   echo -ne "   Reboot system will be done in { $(tput setaf 2)${secs}$(tput sgr 0) } seconds . . .\033[0K\r"
   sleep 1
   : $((secs--))
done
echo ""
echo ""
echo "$(date +"%T") - $(date +"%m/%d/%Y")    >>  SERVER IS REBOOTED" >> /root/log-reboot.txt
echo "   the system is being restarted, please wait a while for it to be ready to use"
echo ""
reboot
