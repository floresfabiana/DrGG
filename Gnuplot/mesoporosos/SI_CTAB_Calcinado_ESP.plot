#Para ver en pantalla
reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "SI_CTAB_Calcinado_ESP.tikz" 

#Saco la leyenda
set key bottom left Left reverse samplen 3  font ",10" textcolor rgb "gray40"
#Saco el Borde
unset border

#Saco las marcas
unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb '#800000' lt 1 lw 2 pt 7 ps 1 #Marron
set style line 3 lc rgb '#ff4500' lt 1 lw 2 pt 7 ps 1 #Naranja

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray70' lt 0 lw 1 
set grid back ls 11


#Coloca los nombre de los ejes
set xlabel "$\\text{P/P}_s$" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "Espesor / nm" font ",14" textcolor rgb "gray40" offset  -2,0

#Ploteo todas las funciones que les digamos
plot "SI_CTAB_Calcinado_EPA.txt" using 1:3 with linespoints ls 1 title "Adsorci\'on", "SI_CTAB_Calcinado_EPA.txt" using 5:7 with linespoints ls 3 title "Desorci\'on"
