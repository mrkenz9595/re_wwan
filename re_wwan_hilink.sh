#!/bin/sh

iface="LTE"  # interface LTE
host='8.8.8.8'  # ping test
ping -c 2 -W 15 "$host" > /dev/null
if [ $? -eq 0 ]; then
  echo OK
  exit 0
else
  ifdown "$iface" && sleep 3 && ifup "$iface"
fi
