#!/usr/bin/env sh

echo "allow *.*.*.*" > /etc/rinetd.conf
echo "logfile /dev/stdout" >> /etc/rinetd.conf
echo "$FORWARDING_RULES" | sed "s/; */\n/g" >> /etc/rinetd.conf

if [ "$ANYCONNECT_2FAUTH" == "enabled" ]; then
  echo "2F_auth is enabled, need run /connectvpn.sh manually and enter verification code"
else
  /connectvpn.sh
fi

rinetd -f -c /etc/rinetd.conf
