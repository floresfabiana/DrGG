#!/bin/bash

#Defino algunas varibles utiles

CD_ACTUAL=`pwd`
CD_IMAGENES="Imagenes"
CD_CAPITULOS="Capitulos"

#Veo si estoy es mac o linux
OS=`uname`
if [ "$OS" == "Darwin" ];
 then
   STAT="/usr/bin/stat"
   FECHA="-f %Sm"
else
   STAT="/usr/bin/stat"
   FECHA="-c %y" 
fi 

#Leo el archivo de la tesis
lista_inputs=$(cat Tesis.tex|grep -e "\input{"| awk -F '\input{' '{print $2}'|awk -F '}' '{print $1}')
array_inputs=(`echo ${lista_inputs}`)
#echo ${array_inputs[@]}

# echo "$(tput setaf 4)Control de dependencias:$(tput setaf 0)"
# echo "Tesis.tex"
# echo "Tesis.tex" > ./dependencias.log

#Busco en cada input depndencias de archivos de graficos, imganes y esquemas
	for i in ${array_inputs[@]}; do
		    
	    		#Busca Imagenes	    			
	      		lista_imagenes=$(cat $i|grep -e "{Imagenes/"| awk -F '{Imagenes/' '{print $2}'|awk -F '}' '{print "Imagenes/"$1}')
				array_imagenes=(`echo ${lista_imagenes}`)
				printf '%s\n' "${array_imagenes[@]}"
	done
	for i in ${array_inputs[@]}; do			
				#Busca Esquemas
				lista_esquemas=$(cat ./$i|grep -e "{Esquemas/"| awk -F '{Esquemas/' '{print $2}'|awk -F '}' '{print "Esquemas/"$1}')
				array_esquemas=(`echo ${lista_esquemas}`)
				printf '%s\n' "${array_esquemas[@]}"
	done
	for i in ${array_inputs[@]}; do
	    		#Busca Graficos
				lista_graficos=$(cat ./$i|grep -e "{Graficos/"| awk -F '{Graficos/' '{print $2}'|awk -F '}' '{print "Graficos/"$1}')
				array_graficos=(`echo ${lista_graficos}`)		
			    printf '%s\n' "${array_graficos[@]}"
	done	
		
 printf '%s\n' "${array_inputs[@]}"

exit 0
