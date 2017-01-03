#!/bin/bash

#Salida 0: Esta actualizado, nada que hacer
#Salida 1: Hay que actualizar, escribo timestamp en base de datos
#Salida 2: Error, mal pasada la variable

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
DIR=$(dirname "$1")
DIR_BARRA=./$(echo $DIR|sed 's,./,,')
archivo_sin_dir=$(basename "$1")
archivo=$DIR/$archivo_sin_dir
    #echo "VARIBLE: $1"
    #echo "Varible: $archivo"

#Veo si estoy es mac o linux
OS=`uname`
if [ "$OS" == "Darwin" ];
 then
   STAT="/usr/bin/stat"
   FECHA_NOMBRE="-f%c---%N"
   FECHA="-f%c"
else
   STAT="/usr/bin/stat"
   FECHA_NOMBRE="-c%Y---%n"
   FECHA="-c%Y" 
fi 

#Mando la salida de error a un archivo
exec 2<&-
exec 2<>./Error_timestamp.log

#Verifico si se le pasan variable al archivo
if [ -z "$archivo" ];
  then
  echo " "
  echo "$(tput setaf 1) No se me paso variable para verificar marca de tiempo!$(tput setaf 0)"
  echo " "
  exit 2
fi

function verificaMarca() {

#Toma la fecha actual del archivo 
Marca_actual=$($STAT $FECHA_NOMBRE $archivo)
Marca_existente=`cat Tesis.timestamps|grep $archivo`

#echo "timestamps actual: $Marca_actual"
#echo "timestamps existente: $Marca_existente"

if [ -z $Marca_existente ]; then
     
     #Creo la marca de tiempo en el archivo
     $($STAT $FECHA_NOMBRE  "$archivo" >> Tesis.timestamps)
        #echo "y Compilo"
     exit 1
   elif [ $Marca_existente == $Marca_actual ];then
        #echo "actualizado nada que hacer"
        #echo "no compilo"
     exit 0
    else
        #echo "compilo, desaxctualizado, escribo nueva marca de tiempo"
     $(sed -i.bak s,$Marca_existente,$Marca_actual,g Tesis.timestamps)
     exit 1
 fi

}

#Verifico que exista el archivo
function verifica()  {

   if [ -f $archivo ]; then
        #echo "existe el archivo $1, verifico fecha:"
     verificaMarca $archivo
     exit 1
 else
     echo " "
     echo " No existe el archivo $(tput setaf 1)$1$(tput setaf 0) para verificar marca de tiempo!"
     echo " "
     exit 2
 fi
}

#echo $archivo

verifica $archivo


IFS=$SAVEIFS

exit 0