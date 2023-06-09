#!/bin/bash
sleep 10

if [[ -z "$NGROK_TOKEN" ]]; then
  echo "Please set 'NGROK_TOKEN'"
  exit 2
fi

#if [[ -z "$USER_PASS" ]]; then
#  echo "Please set 'USER_PASS' for user: $USER"
#  exit 3
#fi

echo "Install ngrok"

#wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip
chmod +x ./ngrok

#echo "### Update user: $USER password ###"
#echo -e "$USER_PASS\n$USER_PASS" | sudo passwd "$USER"

echo "Start ngrok proxy for 8080 port"


rm -f .ngrok.log
./ngrok authtoken "$NGROK_TOKEN"
./ngrok http 8080 --log ".ngrok.log" &

sleep 10
HAS_ERRORS=$(grep "command failed" < .ngrok.log)

if [[ -z "$HAS_ERRORS" ]]; then
  echo ""
  #echo "=========================================="
  echo "# 请在浏览器打开 : $(grep -o -E "https://(.+)" < .ngrok.log | sed "s/https:\/\// /" | sed "s/:/:/")"
  echo ""
  echo "网站生成时间:$(date '+%Y-%m-%d %H:%M:%S')"
  echo "有效期:5小时"
  #echo "=========================================="
else
  echo "$HAS_ERRORS"
  exit 4
fi
