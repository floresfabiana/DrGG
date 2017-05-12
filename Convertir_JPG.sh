t#!/bin/bash

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
m=0
CD_ACTUAL=`pwd`
CD_IMAGENES="Imagenes"

#Veo si estoy es mac o linux
OS=`uname`
if [ "$OS" == "Darwin" ];
 then
   CONVERT="/usr/local/bin/convert"
else
   CONVERT="/usr/bin/convert"
fi 

#Mando la salida de error a un archivo
exec 2<&-
exec 2<>./Error_imagenes.log

#Verifico que me pasaron al menos una variable
if [ -z "$1" ];
  then
  echo " "
  echo "Uso: $0 {todo|\$archivo} [-v]"
  echo " "
  exit 0
fi

#Verifico que es verbose o no
if [ "$2" == "-v" ];
      then 
        salida="/dev/stdout"
      elif [ -z "$2" ]; then
        salida='/dev/null'  
      else
        echo " "
        echo "$(tput setaf 1)Opcion $2 Invalida.$(tput setaf 0)"
        echo " "
        exit 1   
    fi 

#Función principal
function principal() {
      ./Verifica-timestamp.sh $i
      if [ $? = 1 ]; then
            archivo=$(basename "$i")
            extension="${archivo##*.}"
            archivo_sin_ext="${archivo%.*}" 
            DIR=$(dirname $i)

            cd $DIR

            echo -n "   Procesando $i: Convirtiendo a JPG..."
              $CONVERT ./$archivo ./$archivo_sin_ext.jpg  >> $salida
              if [ $? = 0 ];then
                resultado="$(tput setaf 2) Listo!$(tput setaf 0)"
                mv $2 -f ./$archivo_sin_ext.jpg $CD_ACTUAL/$CD_IMAGENES
                echo $resultado
            else
                resultado="$(tput setaf 1) Error de conversion!$(tput setaf 0)"
                echo $resultado
                #Fallo Borro la marca de tiempo
                $(sed -i.bak "\%$i%d" $CD_ACTUAL/Tesis.timestamps)
            fi 
      else
          echo "   Procesando $i: $(tput setaf 2)Actualizado $(tput setaf 0)"             
      fi

      cd $CD_ACTUAL 
}

case "$1" in
         todo)
            echo "$(tput setaf 4)Exportando a JPG imagens:$(tput setaf 0)"
            for i in $(find ./$CD_IMAGENES -iname "*.bmp"  -o -iname "*.tif" -o -iname "*.gif" -o -iname "*.png" ); do
                principal $i  $2              
                let "m++" 
            done
        ;;

        *)
          
          if [ -f $1 ];
            then
                i=$1
                principal $i $2
            else
                 echo " "
                 echo "No existe el archivo $1"
                 echo "Uso: $0 {todo|\$archivo}"
                 echo " "
                 cd ..
                 exit 0
             fi
        ;;
esac

IFS=$SAVEIFS

exit 0


