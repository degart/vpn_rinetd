#!/usr/bin/env sh

if [ "$ANYCONNECT_2FAUTH" == "enabled" ]; then
  ( echo $ANYCONNECT_PASSWORD; /bin/sleep 2; read smspass; /bin/sleep 2; echo $smspass ) | openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER --timestamp -b
else
  ( echo $ANYCONNECT_PASSWORD; /bin/sleep 2 ) | openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER --timestamp -b
fi
