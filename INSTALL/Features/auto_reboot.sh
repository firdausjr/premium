#!/bin/bash
# Clear log
if [ -f /var/log/v2ray/access.log ]; then
	echo "" > /var/log/v2ray/access.log
fi
if [ -f /var/log/v2ray/access2.log ]; then
	echo "" > /var/log/v2ray/access2.log
fi
if [ -f /var/log/v2ray/error.log ]; then
	echo "" > /var/log/v2ray/error.log
fi
if [ -f /var/log/trojan-go.log ]; then
	echo "" > /var/log/trojan-go.log
fi
if [ -f /var/log/trojan.log ]; then
	echo "" > /var/log/trojan.log
fi
if [ -d /var/log/journal ]; then
	rm -rf /var/log/journal
fi
history -c

# Reboot
time=$(date +"%T")
date=$(date +"%m/%d/%Y")
echo "${time} - ${date}    >>  SERVER IS REBOOTED" >> /root/log-autoreboot.txt
/sbin/shutdown -r now
