#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "SI_F127_basico_EPA.tikz" 

#Saco la leyenda
set key top left Left reverse samplen 3 font ",10" textcolor rgb "gray40"
#Saco el Borde
unset border

#Saco las marcas
unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb '#800000' lt 1 lw 2 pt 7 ps 1 #Marron
set style line 3 lc rgb '#ff4500' lt 1 lw 2 pt 7 ps 1 #Naranja

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 11 back ls 10 lw 1.5 
set tics nomirror
set y2tics
set y2range [0:35]
set y2tics 5

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 11


#Coloca los nombre de los ejes
set xlabel "Humedad Relativa / \\%HR" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "\'Indice de refracci\'on" font ",14" textcolor rgb "gray40" offset  -2,0
set y2label "\\% Volumen Poroso" font ",14" textcolor rgb "gray40" offset  2,0


#Ploteo todas las funciones que les digamos
plot "Si_BF127-EPA.txt" using 1:2 axes x1y1 with linespoints ls 1 title "Adsorci\'on", "Si_BF127-EPA.txt" using 5:6 with linespoints ls 3 title "Desorci\'on"
