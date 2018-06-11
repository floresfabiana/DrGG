#!/bin/bash

#Defino algunas varibles utiles
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
CD_ACTUAL=`pwd`

for file in $(find ./Gnuplot -name \*.plot); do # Not recommended, will break on whitespace
     echo "$file"
     sed -i 's/gray40/gray20/g' $file
     sed -i 's/gray70/gray50/g' $file
done

#echo -n "Modificando Graficos "
#sed -i 's/color1/color2/g' $file