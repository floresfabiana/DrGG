#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "SI_CTAB_basico_PSD.tikz" 

#Saco la leyenda
set key top right Left reverse samplen 3  font ",14" textcolor rgb "black"
#Saco el Borde
unset border

#Saco las marcas
unset tics

#Fuerza a establecer un rango
set xrange [0:8]
set yrange [0:]
set mxtics 2
set xtics 1

#Defino estilos para cada tipo de linea
set style line 1 lt -1 lw 2 pi -3 pt 6 ps 1.5 lc  rgb '#800000'
set style line 3 lt -1 lw 2 pi -5 pt 7 ps 1.5 lc  rgb '#ff4500'

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray70' lt 0 lw 1 
set grid back ls 11


#Coloca los nombre de los ejes
set xlabel "Di\'ametro / nm" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "Poblaci\'on relativa" font ",14" textcolor rgb "gray40" offset  -2,0

#Ploteo todas las funciones que les digamos
plot "Si_BCTAB-PSD.txt" using ($1*2):($2+0.1) with linespoints ls 1 title "Di\'ametro de poros", "Si_BCTAB-PSD.txt" using ($3*2):($4+0.1) with linespoints ls 3 title "Di\'ametro de cuellos"
