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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-l2tp")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "        You have no existing clients!"
		echo ""
		sleep 2
		ltp
	fi
	echo ""
	echo " Press CTRL+C to return"
	echo " Select the existing client you want to remove"
	echo " ============================================="
	echo ""
	grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			echo ""
			read -rp "       Select One Client [1] : " CLIENT_NUMBER
		else
			echo ""
			read -rp "       Select One Client [1-${NUMBER_OF_CLIENTS}] : " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	VPN_USER=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
# Delete VPN user
sed -i '/^"'"$VPN_USER"'" l2tpd/d' /etc/ppp/chap-secrets
# shellcheck disable=SC2016
sed -i '/^'"$VPN_USER"':\$1\$/d' /etc/ipsec.d/passwd
sed -i "/^### $VPN_USER $exp/d" /var/lib/premium-script/data-user-l2tp
# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e ""
echo -e "     Client Name $VPN_USER from Account L2TP Successfully Deleted"
echo -e ""
