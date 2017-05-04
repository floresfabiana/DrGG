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
FILES=`find $1 -type f|grep teq4`
		
#Loop
for i in $FILES
do 
	
	#Variables del TEQ4
	N=$(head -30 $i |grep 'CountV'|sed 's/[^0-9]//g')
	Vi='147'
	Vf=$(($N + 147 - 1))p
	Ii=$(( $N + 147 ))
	If=$((2 * $N + 147 -1))p
	
	#Archivo de salida
	salida="${i%.*}.txt"
	
	echo "Procesando archivo: $i"
	#Verificaciones
		#echo "	N="$N
		#echo "	Vi="$Vi
		#echo "	Vf="$Vf
		#echo "	Ii="$Ii
		#echo "	If="$If
	
	echo " Escribiendo Valores de Potencial a temporal" 
	cat $i |sed -n $Vi,$Vf > ValoresV
	echo " Escribiendo Valores de intensidad a temporal"
	cat $i |sed -n $Ii,$If > ValoresI
	echo " Escribiendo en $salida"
	paste -d " " ValoresV ValoresI > $salida

     #Saco el ^M
     cat $salida |sed -e "s/\//" > $salida.sincontrolM
     mv $salida.sincontrolM $salida



	 # touch 	temporal0.txt	
	 # for j in {1..45}
	 #  	do
	 #  		k=$(($j - 1))
	 #  		Vii=$(($j*1200-1200+1))
	 #  		Vff=$(($j*1200))p
	 #  		cat $salida |sed -n $Vii,$Vff > temporal$j.txt
	 #  		#paste -d temporal$k.txt temporal$j.txt  >> temporal$j.txt
	 #  	done	
	
done

#Borro temporales
	rm ValoresV
	rm ValoresI

exit 0	
