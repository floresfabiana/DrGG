#!/bin/bash

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
m=0
CD_ACTUAL=`pwd`
CD_GRAFICOS="Graficos"

#Mando la salida de error a un archivo
exec 2<&-
exec 2<>./Error_graficos.log

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
        BORRA_PDF="Borra PDF:"
        BORRA_TMP="Borra temporales:"
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

#Verifico la marca de tiempo              
#echo $i
./Verifica-timestamp.sh $i
if  [ $? = 1 ]; then
      
      #Extraigo el nombre de archivo y la ubicacion
      archivo=$(basename "$i")
      extension="${archivo##*.}"
      archivo_sin_ext="${archivo%.*}"
      DIR=$(dirname "$i")
      DIRTEX=`echo $DIR|sed "s/\/$CD_GRAFICOS//"`
          
      #Escribo en el include del latex
      echo \\includetikz{"$DIRTEX"/$archivo_sin_ext} > $CD_ACTUAL/$CD_GRAFICOS/grafico_tmp.tex
          
      #Me fijo si es Verbose
      if [ "$2" == "-v" ]; then 
       echo "Borrando PDF:"
      fi 

      #Borro el PDF
      /bin/rm $2 -f $CD_GRAFICOS/$archivo_sin_ext.pdf

      echo -n "   Procesando $i: Exportando a PDF..."
      #Ejecuto PDFLatex
      cd $CD_GRAFICOS
      pdflatex -shell-escape $CD_ACTUAL/$CD_GRAFICOS/Compila_graficos.tex >> $salida 
      if [ $? = 0 ];then
        resultado="$(tput setaf 2) Listo!$(tput setaf 0)"
        echo $resultado
       else
        resultado="$(tput setaf 1) Error de compilacion!$(tput setaf 0)"
        echo $resultado
        #Fallo Borro la marca de tiempo
        $(sed -i.bak "\%$i%d" $CD_ACTUAL/Tesis.timestamps)
    
       fi  
      #Muevo el PDF generado
      mv $2 -f $DIRTEX/$archivo_sin_ext.pdf ./
      cd ..

      #Me fijo si es Verbose
      if [ "$2" == "-v" ]; then 
          echo "Borrando Temporales:"
      fi 

      #Borro los temporales
      /bin/rm $2 -f $CD_ACTUAL/$CD_GRAFICOS/Compila_graficos.aux 
      /bin/rm $2 -f $CD_ACTUAL/$CD_GRAFICOS/Compila_graficos.auxlock
      /bin/rm $2 -f $CD_ACTUAL/$CD_GRAFICOS/Compila_graficos.log
      /bin/rm $2 -f $CD_ACTUAL/$CD_GRAFICOS/Compila_graficos.pdf
      /bin/rm $2 -f $CD_ACTUAL/$CD_GRAFICOS/grafico_tmp.tex
      /bin/rm $2 -f $CD_ACTUAL/$DIR/$archivo_sin_ext.log
      /bin/rm $2 -f $CD_ACTUAL/$DIR/$archivo_sin_ext.dpth
      cd $CD_ACTUAL
else
      echo "   Procesando $i: $(tput setaf 2)Actualizado $(tput setaf 0)"
fi
}

case "$1" in
        todo)
            echo "$(tput setaf 4)Exportando a PDF graficos TIKZ:$(tput setaf 0)"
            for i in $(find ./$CD_GRAFICOS -iname "*.tikz"); do
                principal $i $2
            done
         ;;

        *)
          archivo=$(basename "$1")
         
          if [ -f $1 ];
            then
                i=$(find ./$CD_GRAFICOS -iname $archivo)
                principal $i $2

                exit 0    
            else
                 echo " "
                 echo "No existe el archivo $(tput setaf 1)$1$(tput setaf 0)"
                 echo "Uso: $0 {todo|\$archivo} [-v]"
                 echo " "
                 exit 1
             fi
        ;;
esac

IFS=$SAVEIFS

exit 0