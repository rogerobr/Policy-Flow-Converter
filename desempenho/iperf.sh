#!/bin/sh

contador=0

while [ $contador -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 100 >> 100mb.txt
        sleep 1;
        let contador=$contador+1;
done


contador2=0

while [ $contador2 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 500 >> 500mb.txt
        sleep 1;
        let contador2=$contador2+1;
done

contador3=0

while [ $contador3 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 1000 >> 1000mb.txt
        sleep 1;
        let contador3=$contador3+1;
done

contador4=0

while [ $contador4 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 1500 >> 1500mb.txt
        sleep 1;
        let contador4=$contador4+1;
done

contador5=0

while [ $contador5 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 2000 >> 2000mb.txt
        sleep 1;
        let contador5=$contador5+1;
done

contador6=0

while [ $contador6 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 2500 >> 2500mb.txt
        sleep 1;
        let contador6=$contador6+1;
done

contador7=0

while [ $contador7 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 3000 >> 3000mb.txt
        sleep 1;
        let contador7=$contador7+1;
done

contador8=0

while [ $contador8 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 3100 >> 3100mb.txt
        sleep 1;
        let contador8=$contador8+1;
done

contador9=0

while [ $contador9 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 3200 >> 3200mb.txt
        sleep 1;
        let contador9=$contador9+1;
done

contador10=0

while [ $contador10 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 6400 >> 6400mb.txt
        sleep 1;
        let contador10=$contador10+1;
done

contador11=0

while [ $contador11 -lt 30 ];
do
        iperf3 -c 10.1.0.10 -u -b 100m -l 12800 >> 12800mb.txt
        sleep 1;
        let contador11=$contador11+1;
done

exit 0
