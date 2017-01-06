#!/bin/bash

#Esto lo voy a poder usar cuando quiera reducir y optimizar el tamaño final de la Tesis
#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -dAutoRotatePages=/None -sOutputFile=reducido.pdf Tesis.pdf

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
m=0
CD_ACTUAL=`pwd`


echo " "

#Convierto graficos, imagenes y esquemas
function compilaciones_anexos() {
./Compila-plots.sh todo
./Compila-graficos.sh todo
./Compila-esquemas.sh todo
#./Convertir_JPG.sh todo
./Modifica_bib.sh
}

#Cotrola que las depencias de archivos existan
function controla_dependencias() {
  ./Dependencias.sh
  if [ $? == 1 ]; then
    echo " "
    echo "$(tput setaf 1)  Error: Dependencias incumplidas$(tput setaf 0)"
    echo " "
    exit    
  fi  
}

#Compilo la tesis 

function compilatresveces() {

TIMEFORMAT='%R Segundos!'
echo " "
echo -n "Compilando Tesis primera vez...."

TIEMPO1="$(time (
pdflatex -halt-on-error Tesis.tex  > ./Tesis-compilacion.log 2>&1
if [ $? = 0 ];then
	salida="$(tput setaf 2)  Listo, compilado en "
	echo -n $salida
else
 	salida="$(tput setaf 1)  Error de compilacion! Terminado en "
    echo -n $salida
    
fi) 2>&1)"
echo "$TIEMPO1 $(tput setaf 0)"


echo -n "Compilando referencias...."
TIEMPO2="$(time (
bibtex Tesis  > ./Tesis-compilacion-bib.log 2>&1
if [ $? = 0 ];then
	salida="$(tput setaf 2)        Listo, compilado en "
	echo -n $salida
else
 	salida="$(tput setaf 1)        Error de compilacion, terminado en "
    echo -n $salida
    
fi) 2>&1 )"
echo "$TIEMPO2 $(tput setaf 0)"

echo -n "Compilando Indice Alfabetivo...."
TIEMPO5="$(time (
makeindex -s Tesis.ist Tesis.idx  > ./Tesis-compilacion-indice.log 2>&1
if [ $? = 0 ];then
    salida="$(tput setaf 2)  Listo, compilado en "
    echo -n $salida
else
    salida="$(tput setaf 1)  Error de compilacion, terminado en "
    echo -n $salida
    
fi) 2>&1 )"
echo "$TIEMPO5 $(tput setaf 0)"


echo -n "Compilando Tesis segunda vez...."
TIEMPO3="$(time (
pdflatex -halt-on-error Tesis.tex  > ./Tesis-compilacion.log 2>&1
if [ $? = 0 ];then
	salida="$(tput setaf 2)  Listo, compilado en "
	echo -n $salida
else
 	salida="$(tput setaf 1)  Error de compilacion! Terminado en "
    echo -n $salida
    
fi) 2>&1 )"
echo "$TIEMPO3 $(tput setaf 0)"

echo -n "Compilando Tesis tercera vez...."
TIEMPO4="$(time (
pdflatex -halt-on-error Tesis.tex  > ./Tesis-compilacion.log 2>&1
if [ $? = 0 ];then
	salida="$(tput setaf 2)  Listo, compilado en "
	echo -n $salida
else
 	salida="$(tput setaf 1)  Error de compilacion! Terminado en "
    echo -n $salida

fi) 2>&1 )"
echo "$TIEMPO4 $(tput setaf 0)"
echo " "
}


function solounavez() {

TIMEFORMAT='%R Segundos!'
echo " "
echo -n "Compilando Tesis...."

TIEMPO1="$(time (
pdflatex -halt-on-error Tesis.tex  > ./Tesis-compilacion.log 2>&1
if [ $? = 0 ];then
	salida="$(tput setaf 2)  Listo, compilado en "
	echo -n $salida
else
 	salida="$(tput setaf 1)  Error de compilacion! Terminado en "
    echo -n $salida
    
fi) 2>&1)"
echo "$TIEMPO1 $(tput setaf 0)"
echo " "
}

function abre() {
#Veo si estoy es mac o linux
 OS=`uname`
 if [ "$OS" == "Darwin" ];
  then
    open -a Preview.app Tesis.pdf > /dev/null 2>&1
 else
    gnome-open Tesis.pdf > /dev/null 2>&1 
 fi 
}

case "$1:$2:$3" in

    "":"":"")
        compilaciones_anexos
        controla_dependencias
        solounavez
        abre 
    ;;

    -bib:"":"")
        compilaciones_anexos
        controla_dependencias
        compilatresveces
        abre
    ;;

    -d:"":"")
        controla_dependencias
        solounavez
        abre
    ;;

     -s:"":"")
        solounavez
        abre
    ;;

    -mail:"":"")
        echo -n "Reduciendo tamaño:"
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4  -dAutoRotatePages=/None -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=Tesis-reducida.pdf Tesis.pdf
            if [ $? = 0 ];then
              echo "$(tput setaf 2)  Listo!$(tput setaf 0)"
              echo "Reporte:"
              du -xhs Tesis*.pdf
                  else
              echo "$(tput setaf 1)  Error, no se pudo reducir!"
            fi
            
    ;;

    -ind:"":"")
        echo -n "$(tput setaf 4)Creando el Índice:$(tput setaf 0)"  
        echo " "
            cd Indice
              python Indexa.py
            cd ..
            if [ $? = 0 ];then     
              echo " "
              compilaciones_anexos
              controla_dependencias
              compilatresveces
                  else
              echo "$(tput setaf 1)  Error, no se crear el indicer!"
            fi
            cp Tesis.tex.backup Tesis.tex
            abre
            
    ;;

    -bib:-b:"")
        ./Limpia-Temporales.sh
        compilaciones_anexos
        controla_dependencias
        compilatresveces
        abre
        ;;

    -bib:-l:"")
        compilaciones_anexos
        controla_dependencias
        compilatresveces
        ./Limpia-Temporales.sh
        abre
        ;;
    
    -bib:-l:-b|-bib:-b:-l)
        ./Limpia-Temporales.sh
        compilaciones_anexos
        controla_dependencias
        compilatresveces
        ./Limpia-Temporales.sh
        abre
        ;;        
    
    -b:"":"")
        ./Limpia-Temporales.sh
        compilaciones_anexos
        controla_dependencias
        solounavez
        abre
        ;;

    -l:"":"")
        compilaciones_anexos
        controla_dependencias
        solounavez
        ./Limpia-Temporales.sh
        abre
        ;;

    -b:-l:""|-l:-b:"")
        ./Limpia-Temporales.sh
        compilaciones_anexos
        controla_dependencias
        solounavez
        ./Limpia-Temporales.sh
        abre
        ;;

    -bib:*:*|*)
        echo "El archivo a compilar se tiene que llamar <Tesis.tex>."
        echo " "
        echo "Opción incorrecta!"
        echo " "
        echo "Uso: $0 {-bib|-mail|-ind|-d|-s} [-b] [-l]"
        echo " "
        echo "Sin ninguna opción compila los plots, los graficos en tikz, los esquemas, conotrola las depencias dentro de los distintos <tex> y luego compila el documento <Tesis.tex> solo una vez. No compila Indice ni Bibliografia.  "
        echo " "
        echo "-bib   Compila una vez, compila con bibtex y compila dos veces mas para las referencias cruzadas"
        echo "-b     Limpia todos los auxilires y archivos temporales antes de compilar"
        echo "-l     Limpia todos los auxilires y archivos temporales luego de compilar"
        echo "-mail  Reduce el tamaño de las imagenes (tambien PDF) para mandar por mail"
        echo "-ind   Busca y reemplaza las palabras para el índice alfabético"
        echo "-d     Controla las dependencias, luego compila una vez"
        echo "-s     Compila solo una vez, sin control de dependencias"
        echo " "
        exit 1 
        ;;


    esac    

exit 0


