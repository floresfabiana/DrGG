#!/bin/bash

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#Encuentra los archivos a partir del directorio que le doy, tambien le puedo pasar de argumento un archivo, lo que importa es que no tenga "/" al final
FILES=`find $1 -type f|grep txt`
		
#Loop
for i in $FILES
do 

	
	#Archivo de salida
	filename=$(basename "$i")
	salida="${i%.*}-Separados.txt"
	directorio="$(dirname $i)"
	
		 # cantidad de ciclos	
	  for j in {1..45}
	   	do
	   		k=$(($j + 9))
	   		Vii=$(($j*1400-1400+1)) #Puntos por voltagrama
	   		Vff=$(($j*1400))p
	   		cat $i |sed -n $Vii,$Vff > $directorio/temporal$k.temp
	   	done	
	
	   	paste $directorio/temporal*.temp  > $salida
	   	rm $directorio/temporal*.temp

done

paste $directorio/*-Separados.txt > $directorio/MAXIMOS-TODOS.txt

#Borro temporales
exit 0	
