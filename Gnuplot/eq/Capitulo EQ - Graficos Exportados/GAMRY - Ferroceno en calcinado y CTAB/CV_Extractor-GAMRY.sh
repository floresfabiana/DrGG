#!/bin/bash

#Defino algunas varibles utiles
 SAVEIFS=$IFS
 IFS=$(echo -en "\n\b")
 CD_ACTUAL=`pwd`
 p=\$p
 d=\$d 
 corte=5

#Verifico que me pasaron al menos una variable
 if [ -z "$1" ];
  then
  echo " "
  echo "Uso: $0 {\$archivo|\$directorio}"
  echo " "
  exit 0
 fi

#Función principal
 function principal() {

  declare -a  CiclosCV
  
  #verificaciones
   #echo "file: $file"
   #echo "DIR: $DIR"
   #echo "archivo: $archivo"
 
  #Me fijo cuantas CV son y las almaceno en un array
  CiclosCV=( `cat "$file"|grep "CURVE"|cut -f1`)
  
  #Loop para separar cada CV
    for (( i = 0 ; i < ${#CiclosCV[@]}-1 ; i++))
      do
        j=$(( i + 1 ))
        
        #Primero selecciono cada CV de los datos y la mando a un archivo temporal
        cat $file|sed -n -e "/${CiclosCV[$i]}/,$p"|sed -e "/${CiclosCV[$j]}/,$d" > $DIR/$archivo".tmp"
        
        #Verifico que el archivo sea largo (tenga mas lineas que el corte)
        lineas=$(wc -l < $DIR/$archivo".tmp")
        if [ "$lineas" -ge "$corte" ]; then
             #Selecciono solo los varoles de potencia e intesidad de pico
             cat $DIR/$archivo".tmp"|cut -f4,5|sed '1d' > $DIR/$archivo"-Ciclo"-$j".txt"
        fi        

        #Borro temporal
        rm $DIR/$archivo".tmp"

        done
 }

#La sentencia case
case "$1" in
        
        *)
          
          if [ -f $1 ];
            then
                  #genero variables a partir del filename
                  file=$1
                  archivo=$(basename "$file")
                  DIR=$(dirname $file)
                
                  #me muevo al directorio de trabajo
                  cd $DIR
                  echo "$(tput setaf 4)Extrayendo Voltagrama: $archivo $(tput setaf 0)"
                  
                  #Ejecuto la extraccion de los datos
                  principal $DIR $file $archivo
                  cd $CD_ACTUAL
                  
                  exit 0
          fi         
          
          if [ -d $1 ];
            then
                  cd $1

                  #Si me pasan un directorio lo hago recursivo   
                  for i in $(find ./ -iname "*.DTA"); do
                  
                    #genero variables a partir del filename
                    archivo=$(basename $i)
                    file=$(readlink -f $i)
                    DIR=$(dirname $(readlink -f $i))
                    
                    #me muevo al directorio de trabajo
                    echo "$(tput setaf 4)Extrayendo Voltagrama: $archivo $(tput setaf 0)"
                    
                    #Ejecuto la extraccion de los datos
                    principal $DIR $file $archivo
                    
                  done
                
                cd $CD_ACTUAL               
                exit 0

          fi

             echo " "
             echo "No existe el archivo $1"
             echo "Uso: $0 {\$archivo|\$directorio}"
             echo " "
             cd ..
             exit 1
                         
        ;;
 esac

IFS=$SAVEIFS

exit 0