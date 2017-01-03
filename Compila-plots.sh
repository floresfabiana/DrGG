#!/bin/bash

#Veo si estoy es mac o linux
OS=`uname`
if [ "$OS" == "Darwin" ];
 then
   GNUPLOT="/opt/local/bin/gnuplot"
else
   #GNUPLOT="/usr/bin/gnuplot" #Version 5.0 patchlevel rc2    last modified 2014-08-28
   GNUPLOT="/usr/local/bin/gnuplot" #Version 5.0 patchlevel 3    last modified 2016-02-21
fi 

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
m=0
CD_ACTUAL=`pwd`
CD_GNUPLOT="Gnuplot"
CD_GRAFICOS="Graficos"
TIKZ="Tikz"

#Mando la salida de error a un archivo
exec 2<&-
exec 2<>./Error_plots.log


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
        salida="/dev/null"  
       else
        echo " "
        echo "$(tput setaf 1)Opcion $2 Invalida.$(tput setaf 0)"
        echo " "
        exit 1   
    fi 

#Función principal
function principal() {

./Verifica-timestamp.sh $i
if  [ $? = 1 ]; then

    #Extraigo el nombre de archivo y la ubicacion
    archivo=$(basename "$i")
    extension="${archivo##*.}"
    archivo_sin_ext="${archivo%.*}"
    DIR=$(dirname "$i")

    cd $DIR

    echo -n "   Procesando $i: Compilando...."

    #Agregar aca un If error.... asi si tiene un error en la copilacion me entero

    #$($GNUPLOT $i $salida)
    #pwd
    #echo "$GNUPLOT $archivo >> $salida"
    $($GNUPLOT $archivo >> $salida) 
    if [ $? = 0 ];then
        resultado="$(tput setaf 2) Listo!$(tput setaf 0)"
        echo $resultado
    else
        resultado="$(tput setaf 1) Error de compilacion!$(tput setaf 0)"
        #Fallo Borro la marca de tiempo
        echo $resultado
        $(sed -i.bak "\%$i%d" $CD_ACTUAL/Tesis.timestamps)
    
    fi

    if [ "$2" == "-v" ]; then
         echo "Moviendo Graficos a $CD_GRAFICOS:"
    fi
    
    #echo "mv $2 ./$archivo_sin_ext.tikz $CD_ACTUAL/$CD_GRAFICOS/$TIKZ/$archivo_sin_ext.tikz" 
    mv $2 -f ./$archivo_sin_ext.tikz $CD_ACTUAL/$CD_GRAFICOS/$TIKZ/$archivo_sin_ext.tikz
    
    cd $CD_ACTUAL

    else
         
    echo "   Procesando $i: $(tput setaf 2)Actualizado $(tput setaf 0)"
fi
}

case "$1" in
        todo)
           echo "$(tput setaf 4)Compilando graficos GNUPlot a TIKZ:$(tput setaf 0)"
           for i in $(find ./$CD_GNUPLOT -iname "*.plot"); do
                    principal $i $2
                    let "m++"
           done    
        ;;

        *)
        
          archivo=$(basename "$1")
         
          if [ -f $1 ];
            then
                i=$(find ./$CD_GNUPLOT -iname $archivo)
                principal $i $2
                 
            else
                 echo " "
                 echo "No existe el archivo $(tput setaf 1)$1$(tput setaf 0)"
                 echo "Uso: $0 {todo|\$archivo} [-v]"
                 echo " "
                 exit 1
             fi
        ;;
        
esac

exit 0

IFS=$SAVEIFS
