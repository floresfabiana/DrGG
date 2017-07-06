#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
#set terminal tikz tikzarrows
#set output "ACV-ideal.tikz" 

#Archivos CSV
set datafile separator ","

#Histograma
set style data histograms

#set style histogram gap 1

set xtics rotate by 90  offset 0, -0.2, 0 right
    #set xtics  norangelimit font ",8"
    #set xtics   ()

plot 'Scopus-180742-Analyze-Country2.csv' using 2:xtic(1) 