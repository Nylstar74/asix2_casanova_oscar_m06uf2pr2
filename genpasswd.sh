#!/bin/bash
#Víctor Caballero Roca
#generaPasswd.sh


clear

while [[ true ]]
	do
	echo "Numero de usuarios entre el 1 y 100"
	read NumeroUsuaris
	if ((NumeroUsuaris >=1 && NumeroUsuaris <=100))
	then
		while [[ true ]]
		do
		echo "Número de UID, minimo 5000"
		read uidNumber
		if ((uidNumber >= 5000))
		then
			for ((contador=0; contador<NumeroUsuaris; contador++ ))
			do
			PASSWORD=$(echo $RANDOM$(date +%N%s) | md5sum | cut -c 2-9)
			echo "usr$uidNumber:$PASSWORD" | chpasswd
			echo "usr$uidNumber:$PASSWORD" >> ctsUsuaris.txt
			echo "____" >> ctsUsuaris.txt
			((uidNumber++))
			done
			break;
			fi	
	done
	break;
	fi
	
done
exit 0
