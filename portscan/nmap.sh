#!/bin/sh

contador=0

while [ $contador -lt 30 ];
do
        nmap -P0 -iL hosts.txt -p 443,2500,22,8443,5000,1521,3389,445,3000,102,5050,21,53,67,2222,389,3268
        sleep 1;
        let contador=$contador+1;
done


contador2=0

while [ $contador2 -lt 30 ];
do
        sudo nmap -sU -P0 -iL hosts.txt -p U:443,U:2500,U:22,U:8443,U:5000,U:1521,U:3389,U:445,U:3000,U:102,U:5050,U:21,U:53,U:67,U:2222,U:389,U:3268
        sleep 1;
        let contador2=$contador2+1;
done

exit 0
