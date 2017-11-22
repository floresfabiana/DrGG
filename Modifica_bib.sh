#!/bin/bash

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
CD_ACTUAL=`pwd`
CD_BIB="Referencias"

#Función principal
  function principal() {

  echo "$(tput setaf 4)Bibliografia:$(tput setaf 0)"

  #Copio la base bibliografica
  #Veo si estoy es mac o linux
  OS=`uname`
  if [ "$OS" == "Darwin" ];
   then
     echo -n "   Estoy en Clementina... no hago ninguna modificación en la base bibliografica."
     echo " "
     exit 0
     # echo -n "   Copiando Base Bibliografica.... "
     #  cp /Users/gustavo/Documents/Mendeley\ Desktop/library.bib $CD_ACTUAL/$CD_BIB/base_bibliografica.bib > ./Error_bib.log 2>&1
     # if [ $? = 0 ];then
     #   salida="$(tput setaf 2)  Listo!$(tput setaf 0)"
     # echo $salida
     # else
     # salida="$(tput setaf 1)  Error!$(tput setaf 0)"
     #   echo $salida
     # fi  
  else
     echo -n "   Copiando Base Bibliografica del Mendeley.... "
     cp /home/gustavo/Documentos/Mendeley\ Desktop/library.bib $CD_ACTUAL/$CD_BIB/base_bibliografica.bib > ./Error_bib.log 2>&1
     if [ $? = 0 ];then
       salida="$(tput setaf 2)  Listo!$(tput setaf 0)"
     echo $salida
     else
     salida="$(tput setaf 1)  Error!$(tput setaf 0)"
       echo $salida
     fi  
  fi 

  #Hago un backup de la Base Bibliografica
  echo -n "   Haciendo backup de la base bibliografica del Mendeley....  "
     cp $CD_BIB/base_bibliografica.bib $CD_BIB/base_bibliografica.bak
      if [ $? = 0 ];then
       salida="$(tput setaf 2)  Listo!$(tput setaf 0)"
     echo $salida
     else
     salida="$(tput setaf 1)  Error!$(tput setaf 0)"
       echo $salida
     fi  

  #Modifico la Base Bibliografica

      #Modifico la base tal como sale del Mendeley porque no la entiende el BibTex
      echo -n "   Modificando la base bibligrafica....  "
      sed -i.tmp 's/month = {jan}/month = jan/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {feb}/month = feb/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {mar}/month = mar/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {apr}/month = apr/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {may}/month = may/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {jun}/month = jun/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {jul}/month = jul/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {aug}/month = aug/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {sep}/month = sep/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {oct}/month = oct/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {nov}/month = nov/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/month = {dec}/month = dec/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/TiO2/TiO$_2$/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/SiO2/SiO$_2$/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/1:10^5/$1:10^5$/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/AlGaN/$\\text{Al}_{1-X}\\text{Ga}_{X}\\text{N}$/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/\&/\\&/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/Zr1xO2/$\\text{Zr}_{1-X}\\text{Si}_{X}\\text{O}_{2}$/g' $CD_BIB/base_bibliografica.bib
      sed -i.tmp 's/700C/$700^{\\circ}$C/g' $CD_BIB/base_bibliografica.bib

      #Verifico que todo salió bien
      if [ $? = 0 ];then
           salida="$(tput setaf 2)  Listo!$(tput setaf 0)"
         echo $salida
         else
         salida="$(tput setaf 1)  Error!$(tput setaf 0)"
           echo $salida
      fi 

  #Borro el temporal
  rm $CD_BIB/base_bibliografica.bib.tmp
}

#Llamo a al función
principal

IFS=$SAVEIFS

exit 0