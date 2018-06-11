#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "SI_CTAB_vacio_PSD.tikz" 

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
set style line 10 lc rgb 'gray20' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror font ",16" textcolor rgb 'gray20'
set xtics offset 0,-0.3

#Estilo de la grilla
set style line 11 lc rgb 'gray50' lt 0 lw 1 
set grid back ls 11


#Coloca los nombre de los ejes
set xlabel "Di\'ametro / nm" font ",18" textcolor rgb "gray20" offset  0,-2
set ylabel "Poblaci\'on relativa" font ",18" textcolor rgb "gray20" offset  -2.5,0

#Ploteo todas las funciones que les digamos
plot "Si_130VCTAB-PSD.txt" using ($1*2+0.5):($2) with linespoints ls 1 title "Di\'ametro de poros", "Si_130VCTAB-PSD.txt" using ($3*2+0.5):($4) with linespoints ls 3 title "Di\'ametro de cuellos"
