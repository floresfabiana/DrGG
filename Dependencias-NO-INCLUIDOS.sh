#!/bin/bash

#Defino algunas varibles utiles

CD_ACTUAL=`pwd`
CD_IMAGENES="Imagenes"
CD_ESQUEMAS="Esquemas"
CD_GRAFICOS="Graficos"
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

#Borra las salidas
rm Tesis_lista_imagenes.txt
rm Tesis_lista_esquemas.txt
rm Tesis_lista_graficos.txt
rm Tesis_lista_tex.txt

#Busco en cada input depndencias de archivos de graficos, imganes y esquemas
	for i in ${array_inputs[@]}; do

	    		#Busca Imagenes	    			
	      		lista_imagenes=$(cat $i|grep -e "{Imagenes/"| awk -F '{Imagenes/' '{print $2}'|awk -F '}' '{print "Imagenes/"$1}')
				array_imagenes=(`echo ${lista_imagenes}`)
				printf '%s\n' "${array_imagenes[@]}" >> Tesis_lista_imagenes.txt
				sed -i.bak '/^$/d' Tesis_lista_imagenes.txt

	done
	for i in ${array_inputs[@]}; do			
				#Busca Esquemas
				lista_esquemas=$(cat ./$i|grep -e "{Esquemas/"| awk -F '{Esquemas/' '{print $2}'|awk -F '}' '{print "Esquemas/"$1}')
				array_esquemas=(`echo ${lista_esquemas}`)
				printf '%s\n' "${array_esquemas[@]}" >> Tesis_lista_esquemas.txt
				sed -i.bak '/^$/d' Tesis_lista_esquemas.txt
	done
	for i in ${array_inputs[@]}; do
	    		#Busca Graficos
				lista_graficos=$(cat ./$i|grep -e "{Graficos/"| awk -F '{Graficos/' '{print $2}'|awk -F '}' '{print "Graficos/"$1}')
				array_graficos=(`echo ${lista_graficos}`)		
			    printf '%s\n' "${array_graficos[@]}" >> Tesis_lista_graficos.txt
				sed -i.bak '/^$/d' Tesis_lista_graficos.txt
	done	
		
 printf '%s\n' "${array_inputs[@]}" >> Tesis_lista_tex.txt
				sed -i.bak '/^$/d' Tesis_lista_tex.txt


#Comparo la lista con los que están en los directorios.
#Lista los archivos por directorio

#Para Imagenes
for file in $CD_IMAGENES/*.jpg; do
	[ -e "$file" ] || continue
	cat Tesis_lista_imagenes.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
for file in $CD_IMAGENES/*.png; do
	[ -e "$file" ] || continue
	cat Tesis_lista_imagenes.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
for file in $CD_IMAGENES/*.pdf; do
	[ -e "$file" ] || continue
	cat Tesis_lista_imagenes.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
for file in $CD_IMAGENES/*.tif; do
	[ -e "$file" ] || continue
	cat Tesis_lista_imagenes.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done

#Para Esquemas
for file in $CD_ESQUEMAS/*.pdf; do
	[ -e "$file" ] || continue
	cat Tesis_lista_esquemas.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done

#Para graficos
for file in $CD_GRAFICOS/*.pdf; do
	[ -e "$file" ] || continue
	cat Tesis_lista_graficos.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done

#Para tex
for file in Capitulos/*.tex; do
	[ -e "$file" ] || continue
	cat Tesis_lista_tex.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
for file in PostCapitulos/*.tex; do
	[ -e "$file" ] || continue
	cat Tesis_lista_tex.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
for file in PreCapitulos/*.tex; do
	[ -e "$file" ] || continue
	cat Tesis_lista_tex.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
for file in Configuraciones/*.tex; do
	[ -e "$file" ] || continue
	cat Tesis_lista_tex.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
for file in Referencias/*.tex; do
	[ -e "$file" ] || continue
	cat Tesis_lista_tex.txt|grep $file > /dev/null
	if [ $? == 0 ]; then
			echo "$file: $(tput setaf 2)Necesario!$(tput setaf 0)"
		else
			echo "$file: $(tput setaf 1)No necesario!$(tput setaf 0)"
	fi		
done
exit 0
