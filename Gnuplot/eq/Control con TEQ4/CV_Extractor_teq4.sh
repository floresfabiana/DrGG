#!/bin/bash

#Defino algunas varibles utiles
 SAVEIFS=$IFS
 IFS=$(echo -en "\n\b")
 CD_ACTUAL=`pwd`
 LANG=C

#Veo si estoy es mac o linux
OS=`uname`
if [ "$OS" == "Darwin" ];
 then
   GNUPLOT="/opt/local/bin/gnuplot"
else
   GNUPLOT="/usr/bin/gnuplot"
fi 

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

  #verificaciones que pase bien las variables a la funcion
  # echo "file: $file"
  # echo "DIR: $DIR"
  # echo "archivo: $archivo"
 
  #Extraigo cuantos puntos y ciclos tengo
  valoresV=$(cat "$ArchMod"|grep "CountV:"|sed -r "s/[^0-9]//g")
  valoresI=$(cat "$ArchMod"|grep "CountI:"|sed -r "s/[^0-9]//g")
  ciclosT=$(cat "$ArchMod"|grep "NumCiclos:"|sed -r "s/[^0-9]//g")
 
  #Calculo la cantidad de puntos por ciclo
  PuntosxCicloV=$(( valoresV / ciclosT))
  PuntosxCicloI=$(( valoresI / ciclosT))

  #Loop para separar cada CV
   for ((i=0; i<$ciclosT; i++)); do
           
        #Establezco los rangos de datos
        linea_inicialV=$((147+i*PuntosxCicloV))
        linea_finalV=$((linea_inicialV + PuntosxCicloV - 1))
        linea_inicialI=$((147 + valoresV + i * PuntosxCicloV))
        linea_finalI=$((linea_inicialI + PuntosxCicloI - 1))
        
        #nombre del arvhivo de salida
        j=$(( i + 1 ))
        salida=$archivo"-Ciclo"$j".txt"

        #Almaceno la variable para plotear luego
        ploteo+=\"$salida"\" using 1:2 with lines ls $i,"

        #Declaro los Array
        declare -a  ValoresPotencial
        declare -a  ValoresIntensidad

        #Primero selecciono cada CV de los datos y la mando a un archivo temporal
        pV="$linea_finalV"p
        pI="$linea_finalI"p
        
        #Guardo los valores en dos arrays distintos
        ValoresPotencial=(`cat $ArchMod|sed -n $linea_inicialV,$pV|sed -e "s/[^-?0-9.]//g"`)
        ValoresIntensidad=(`cat $ArchMod|sed -n $linea_inicialI,$pI|sed -e "s/[^-?0-9.]//g"`)

        #Verifico cantidad de datos de los Arrays
        #Verificaciones
        if [ "$2" == "-v" ];
          then 
                echo " "
                echo "    Loop=$i" 
                echo "    ValoresV=$valoresV"
                echo "    ValoresI=$valoresI"
                echo "    Ciclos=$ciclosT"
                echo "    Puntos por ciclo V: $PuntosxCicloV"
                echo "    Puntos por ciclo I: $PuntosxCicloI"
                echo "    InicioV=$linea_inicialV"
                echo "    FinalV=$linea_finalV"
                echo "    InicioI=$linea_inicialI"
                echo "    FinalI=$linea_finalI"
                echo "    Cantidad Array V: ${#ValoresPotencial[@]}"
                echo "    Cantidad Array I: ${#ValoresIntensidad[@]}"
       
         fi       


        #Tiro en el archivo los valores
         printf "%s\t%s\n" "Potencial" "Intensidad" > "$salida"
         printf "%s\t%s\n" "mv" "uA" >> "$salida"
         for k in ${!ValoresIntensidad[@]};
           do
            printf "%f\t%f\n" "${ValoresPotencial[$k]}" "${ValoresIntensidad[$k]}" >> "$salida"
         done
           
     done
     graficar $ploteo
   }

#Funcion para graficar con el GNUPLOT
graficar() {

#LLamo al gnuplot
echo "   Graficando"
$GNUPLOT -persist 2>/dev/null <<EOFMarker
plot $ploteo
EOFMarker
}

#Funcion para convertir los numeros cientificos en decimales
  convetir_numeros() {

      #Declaro el Array
      declare -a NumCient

      #Busco los numeros cientificos y los alamceno en el array
      NumCient=(`cat $archivo|grep [0-9]E|sed -r "s/[^-?0-9.E0-9]//g"`)
      
      #Creo archivo temporal
      ArchModTemp=$archivo".temporal.cambio.cient.dec"

      #Reemplazo los datos cientificos por decimales
      for k in ${!NumCient[@]};
           do
            NumDec=(`printf "%f\n" "${NumCient[k]}"`)
            #echo $NumDec ${NumCient[k]}
            sed s,${NumCient[k]},$NumDec,g $ArchMod > $ArchModTemp
            cp  $ArchModTemp $ArchMod
        done
      rm $ArchModTemp
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
                  
                  #Nuevo nombre de archivo modificado y lo pongo en 0
                  ArchMod=$archivo".mod-dec.txt"
                  cp $archivo $ArchMod

                  echo "$(tput setaf 4)Extrayendo Voltagrama: $archivo $(tput setaf 0)"
                  
                  #Ejecuto la funcion para transformar numeros cientificos
                  echo "   Cambiando numeros a notación decimal"
                  convetir_numeros $archivo $ArchMod
                  
                  #Ejecuto la extraccion de los datos
                  echo "   Separando CV y extrayendo los datos en columnas"
                  principal $ArchMod $2

                  cd $CD_ACTUAL
                  
                  exit 0
          fi         
          
          if [ -d $1 ];
            then
                  cd $1
                  declare -a arch_teq4
                  arch_teq4=(`find ./ -iname "*.teq4"`)

                  #Si me pasan un directorio lo hago recursivo   
                   for i in ${!arch_teq4[@]}; do
                  
                    #genero variables a partir del filename
                    archivo=$(basename ${arch_teq4[i]})
                    file=$(readlink -f ${arch_teq4[i]})
                    DIR=$(dirname $file)
                    
                    # echo " i= $i"
                    # echo " Archivo: $archivo"
                    # echo " file: $file"
                    # echo " Directorio: $DIR"
                    #me muevo al directorio de trabajo
                    cd $DIR
                  
                    #Nuevo nombre de archivo modificado y lo pongo en 0
                    ArchMod=$archivo".mod-dec.txt"
                    cp $archivo $ArchMod

                    echo "$(tput setaf 4)Extrayendo Voltagrama: $archivo $(tput setaf 0)"
                  
                    #Ejecuto la funcion para transformar numeros cientificos
                    echo "   Cambiando numeros a notación decimal"
                    convetir_numeros $archivo $ArchMod
                    
                    #Ejecuto la extraccion de los datos
                    echo "   Separando CV y extrayendo los datos en columnas"
                    principal $ArchMod $2

                    cd $1
                      
                 done
                
                              
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