#!/bin/bash

EXTENSIONES=( aux log auxlock dpth mtc mtc[0-9] mtc[0-9][0-9] synctex synctex.gz toc dvi out maf fls fdb_latexmk temp make out makefile md5 bak M[0-9] lot lof bbl blg)

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
FILE_TMP=logfile
t=0

 echo "$(tput setaf 4)Borrando temporales:$(tput setaf 0)"

for m in "${EXTENSIONES[@]}"
do
  find . -iname "*.$m" -exec rm -v {} \; |tee $FILE_TMP 
  k=`cat $FILE_TMP|wc -l`
  t=$(( $k + $t ))
done

rm $FILE_TMP
IFS=$SAVEIFS


echo " "
echo "$(tput setaf 2)Se borraron $t archivos auxiliares$(tput setaf 0)"
echo " "
