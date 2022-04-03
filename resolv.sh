#Oscar Casanova
#ASIX 2
#!/bin/bash

clear

if (( $EUID != 0 )) # $EUID = 0 if you are running the script with root privileges
then
  echo "This script must be run as a root"
  exit 1 
fi


DATA=$(date +20%y%m%d%H%M)

if [[ ! -d /$1 ]]

then
	echo "Quieres crearlo? si/no (s/n): "
	read opc
	
	if [[ $opc == "s" ]]
	then
		mkdir $1
		cp /etc/resolv.conf $1
	else
		echo "No puedo continuar sin este directorio"
		exit 1
	fi
fi


cd $1
cp resolv.conf resolv.conf.backup.$DATA
for a in resolv.conf.backup.$DATA

do
	gzip $a
done
sudo rm resolv.conf
echo "Comprimido correctamente"



exit 0
