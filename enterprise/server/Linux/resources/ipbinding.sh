#!/bin/sh

ip="$(hostname -i)"
DESTINATION=<DESTINATION>

cd $DESTINATION/ncache/bin/service

printf "%s\n" ",s/<IP>/$ip/g" wq | ed -s Alachisoft.NCache.Daemon.dll.config
printf "%s\n" ",s/<IP>/$ip/g" wq | ed -s Alachisoft.NCache.BridgeDaemon.dll.config

cd $DESTINATION/ncache/config

printf "%s\n" ",s/<IP>/$ip/g" wq | ed -s client.ncconf
printf "%s\n" ",s/<IP>/$ip/g" wq | ed -s config.ncconf 
printf "%s\n" ",s/<IP>/$ip/g" wq | ed -s bridge.ncconf 

rm -f /app/ipbinding.sh