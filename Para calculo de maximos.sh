#!/bin/bash

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#Si no hay varible te chilla
if [ $1 == "" ]
	then
		echo " "
		echo "No se especifico un archivo/directorio"
		echo " "
		exit 1
	fi

#Encuentra los archivos a partir del directorio que le doy, tambien le puedo pasar de argumento un archivo, lo que importa es que no tenga "/" al final
FILES=`find $1 -type f|grep txt`
		
#Loop
for i in $FILES
do 

	
	#Archivo de salida
	filename=$(basename "$i")
	salida="${filename%.*}.txt"
	
	echo $salida
	 # touch 	temporal0.txt	
	  for j in {1..45}
	   	do
	   		k=$(($j - 1))
	   		Vii=$(($j*1200-1200+1))
	   		Vff=$(($j*1200))p
	   		cat $salida |sed -n $Vii,$Vff > temporal$j.txt
	   		#paste -d temporal$k.txt temporal$j.txt  >> temporal$j.txt
	   	done	
	
done

#Borro temporales
exit 0	
