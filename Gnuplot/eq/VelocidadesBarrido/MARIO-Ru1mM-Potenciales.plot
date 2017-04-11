#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "MARIO-Ru1mM-Potenciales.tikz"

#Leyenda
set key top left Left reverse samplen -2 font ",10" textcolor rgb "gray40"

#Separado por comas
set datafile sep','

#Saco el Borde
unset border

#Saco las marcas
unset tics
set logscale x

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Circulos Negros
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid xtics ytics mxtics mytics front ls 11

#Coloca los nombre de los ejes
	set xlabel "v / mV.s$^{-1}$"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "E$^{p}$-E$^{o}_{ap}$ vs ESC / mV"	font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza el rango
	set xrange [40:100000]

#E=-292 es el promedio de los E

#plot "Barrido-Ru1mM-Max-Min.txt" using (log10($1)):(log10($3)) with points ls 1, f(x) with lines ls 2
plot "MARIO-Ru1mM-Max-Min-Corregido.csv" using 1:($3-(-292)) with points ls 1 notitle,\
"MARIO-Ru1mM-Max-Min-Corregido.csv" using 1:($3-(-292)) smooth bezier ls 2 notitle, \
"MARIO-Ru1mM-Max-Min-Corregido.csv" using 1:($5-(-292)) with points ls 1 notitle , \
"MARIO-Ru1mM-Max-Min-Corregido.csv" using 1:($5-(-292)) smooth bezier ls 2 notitle, \