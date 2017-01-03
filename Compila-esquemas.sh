#!/bin/bash

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
m=0
CD_ACTUAL=`pwd`
CD_ESQUEMAS="Esquemas"

#Mando la salida de error a un archivo
exec 2<&-
exec 2<>./Error_esquemas.log

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
      DIRTEX=`echo $DIR|sed "s/\/$CD_ESQUEMAS//"`
          
      #Escribo en el include del latex
      echo \\includetikz{"$DIRTEX"/$archivo_sin_ext} > $CD_ACTUAL/$CD_ESQUEMAS/esquema_tmp.tex
          
      #Me fijo si es Verbose
      if [ "$2" == "-v" ]; then 
       echo "Borrando PDF:"
      fi 

      #Borro el PDF
      /bin/rm -f $2 $CD_ESQUEMAS/$archivo_sin_ext.pdf

      echo -n "   Procesando $i: Exportando a PDF..."
      #Ejecuto PDFLatex
      cd $CD_ESQUEMAS
      pdflatex -shell-escape -halt-on-error $CD_ACTUAL/$CD_ESQUEMAS/Compila_esquemas.tex >> $salida 
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
      /bin/rm $2 -f $CD_ACTUAL/$CD_ESQUEMAS/Compila_esquemas.aux 
      /bin/rm $2 -f $CD_ACTUAL/$CD_ESQUEMAS/Compila_esquemas.auxlock
      /bin/rm $2 -f $CD_ACTUAL/$CD_ESQUEMAS/Compila_esquemas.log
      /bin/rm $2 -f $CD_ACTUAL/$CD_ESQUEMAS/Compila_esquemas.pdf
      /bin/rm $2 -f $CD_ACTUAL/$CD_ESQUEMAS/esquema_tmp.tex
      /bin/rm $2 -f $CD_ACTUAL/$DIR/$archivo_sin_ext.log
      /bin/rm $2 -f $CD_ACTUAL/$DIR/$archivo_sin_ext.dpth
      cd $CD_ACTUAL
else
      echo "   Procesando $i: $(tput setaf 2)Actualizado $(tput setaf 0)"
fi
}

function secundario() {
      
      ./Verifica-timestamp.sh $i
      
      if [ $? = 1 ]; then
            archivo=$(basename "$i")
            extension="${archivo##*.}"
            archivo_sin_ext="${archivo%.*}" 
            DIR=$(dirname $i)

            cd $DIR

            cp $2 $archivo $archivo_sin_ext.tex

            echo -n "   Procesando $i: Exportando a PDF..."
            
            #Ejecuto PDFLatex
            pdflatex -halt-on-error ./$archivo_sin_ext.tex >> $salida 
            if [ $? = 0 ];then
              resultado="$(tput setaf 2) Listo!$(tput setaf 0)"
              echo $resultado
            else
              resultado="$(tput setaf 1) Error de compilacion!$(tput setaf 0)"
              echo $resultado
              #Fallo Borro la marca de tiempo
              $(sed -i.bak "\%$i%d" $CD_ACTUAL/Tesis.timestamps)
            fi

            mv $2 $archivo_sin_ext.pdf $CD_ACTUAL/$CD_ESQUEMAS
            rm $2 $archivo_sin_ext.tex
      else
          echo "   Procesando $i: $(tput setaf 2)Actualizado $(tput setaf 0)"             
      fi

      cd $CD_ACTUAL 
}



case "$1" in
        todo)
            echo "$(tput setaf 4)Exportando a PDF esquemas TIKZ:$(tput setaf 0)"
            for i in $(find ./$CD_ESQUEMAS -iname "*.tikz"); do
                principal $i $2
            done

            for i in $(find ./$CD_ESQUEMAS -iname "*.tikz2"); do
                secundario $i $2
           done
          ;;

       
        *)
           archivo=$(basename "$1")
           extension="${archivo##*.}"
           archivo_sin_ext="${archivo%.*}"
           DIR=$(dirname "$i")
         
          if [ -f $1 ];
            then
                i=$(find ./$CD_ESQUEMAS -iname $archivo)
              
                if [ "$archivo" == "$archivo_sin_ext.tikz" ];
                    then
                      principal $i $2
                                #Abro el archivo
                                #Veo si estoy es mac o linux
                                OS=`uname`
                                if [ "$OS" == "Darwin" ];
                                 then
                                   open -a Preview.app $DIR/$archivo_sin_ext.pdf > /dev/null 2>&1
                                    else
                                   gnome-open $DIR/$archivo_sin_ext.pdf > /dev/null 2>&1 
                                fi 
                    fi
                if [ "$archivo" == "$archivo_sin_ext.tikz2" ];
                    then
                      echo "secundario $1"
                      secundario $i $2
                              #Abro el archivo
                              #Veo si estoy es mac o linux
                              OS=`uname`
                               if [ "$OS" == "Darwin" ];
                                then
                                  open -a Preview.app $DIR/$archivo_sin_ext.pdf > /dev/null 2>&1
                                  else
                                  gnome-open $DIR/$archivo_sin_ext.pdf > /dev/null 2>&1 
                              fi 
                fi                        
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
