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

echo "$(tput setaf 4)Control de dependencias:$(tput setaf 0)"
echo "Tesis.tex"
echo "Tesis.tex" > ./dependencias.log

#Busco en cada input depndencias de archivos de graficos, imganes y esquemas
	for i in ${array_inputs[@]}; do
	    echo "$i" >> ./dependencias.log	 #Escribo al archivo de log
	    echo "  |    "
	    echo -n "  |----$i"	
	    	if [ -f ./$i ]; then
	      		fecha=$($STAT $FECHA $i)
	      		echo ":Modificado $fecha => $(tput setaf 2)Ok!$(tput setaf 0)"
				
				#Busca Imagenes	    			
	      		lista_imagenes=$(cat $i|grep -e "{Imagenes/"| awk -F '{Imagenes/' '{print $2}'|awk -F '}' '{print "Imagenes/"$1}')
				array_imagenes=(`echo ${lista_imagenes}`)
						
					for j in ${array_imagenes[@]}; do
						echo "  $j" >> ./dependencias.log
						if [ -f ./$j ]; then
						fecha=$($STAT $FECHA $j)	
						echo -n "  |  |------$j"
						echo ":Modificado $fecha => $(tput setaf 2)Ok!$(tput setaf 0)"
						else
	    				echo -n "  |  |------$j"
	    				echo "$(tput setaf 1) => Falta archivo!$(tput setaf 0)"
	    				salida_error=1
	    				fi    
	    			done
	    				
				#Busca Esquemas
				lista_esquemas=$(cat ./$i|grep -e "{Esquemas/"| awk -F '{Esquemas/' '{print $2}'|awk -F '}' '{print "Esquemas/"$1}')
				array_esquemas=(`echo ${lista_esquemas}`)
				
					for j in ${array_esquemas[@]}; do
						echo "  $j" >> ./dependencias.log 
						if [ -f ./$j ]; then
						fecha=$($STAT $FECHA $j)	
						echo -n "  |  |------$j"
						echo ":Modificado $fecha => $(tput setaf 2)Ok!$(tput setaf 0)"
						else
	    				echo -n "  |  |------$j"
	    				echo "$(tput setaf 1) => Falta archivo!$(tput setaf 0)"
	    				salida_error=1
	    				fi
	    			done	
				
	    		#Busca Graficos
				lista_graficos=$(cat ./$i|grep -e "{Graficos/"| awk -F '{Graficos/' '{print $2}'|awk -F '}' '{print "Graficos/"$1}')
				array_graficos=(`echo ${lista_graficos}`)		
				
					for k in ${array_graficos[@]}; do
						echo "  $k" >> ./dependencias.log 
						if [ -f ./$k ]; then
						fecha=$($STAT $FECHA $k)	
						echo -n "  |  |------$k"
						echo ":Modificado $fecha => $(tput setaf 2)Ok!$(tput setaf 0)"
						else
	    				echo -n "  |  |------$k"
	    				echo "$(tput setaf 1) => Falta archivo!$(tput setaf 0)"
	    				salida_error=1
	    				fi
	    			done	
	    	else
	    		echo -n "$i"
	    		echo "$(tput setaf 1) => Falta archivo!$(tput setaf 0)"
	    		salida_error=1
	    	fi    	
	done	
		
if [ "$salida_error" == "1" ]; then
	exit 1
fi


exit 0
