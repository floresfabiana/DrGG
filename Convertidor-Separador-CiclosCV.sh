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
	
		 # touch 	temporal0.txt	
	  for j in {1..90}  #Cambiar aca con la cantidad de ciclos del archivo, normalemente 45
	   	do
	   		k=$(($j + 9))
	   		Vii=$(($j*1400-1400+1)) #Colocar aqui las cantidad de puntos del voltagrama 
	   		Vff=$(($j*1400))p
	   		cat $i |sed -n $Vii,$Vff > $directorio/temporal$k.temp
	   	done	
	
	   	paste $directorio/temporal*.temp  > $salida
	   	rm $directorio/temporal*.temp

done

paste $directorio/*-Separados.txt > $directorio/MAXIMOS-TODOS.txt

#Borro temporales
exit 0	
