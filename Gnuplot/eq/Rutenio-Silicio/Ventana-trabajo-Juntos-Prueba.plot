#Para ver en pantalla
reset
set terminal x11

#Para exportar como latex
#set terminal tikz
#set output "Ru0315mM-secuencia-continua-ventana-trabajo.tikz"

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Rectangulo, ventana de trabajo
set style rect fc lt -1 fs solid 0.15 noborder
set obj rect from 33, graph 0 to 40, graph 1
set label at 35,2 "zona de m\'axima" font ",12" rotate by 90 textcolor rgb "gray20" front
set label at 38,2 "preconcentraci\'on" font ",12" rotate by 90 textcolor rgb "gray20" front


#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray70' lt 0 lw 1 
set grid front ls 11

#Coloca los nombre de los ejes
	set xlabel "N\'umero de ciclos"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{I}_p^{np}/\\text{I}_p^{\\text{Au}}$"	font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
#	set xrange [0:41]
#	set yrange [-1000:1000]

#EL valor 4.01 corresponde al pico maximo en la oxidación.
plot "Ru0315mM-secuencia-continua-ventana-trabajo2.txt" using 2:($3*1.10-0.85) every ::66::199 with points ls 1, \
"Ru0315mM-secuencia-continua-ventana-trabajo.txt" using 3:4 with lines ls 3,\
"Ru0315mM-secuencia-continua-ventana-trabajo.txt" using 1:($2*0.8-0.65) with points ls 1,\
"Ru10mM/Ru10mM-ventana-preconcentracion3.txt" using ($1):($3) every ::1::110 with points ls 1,\
"Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using ($1):($3/4.01) with points ls 1, \

#plot "Ru0315mM-secuencia-continua-ventana-trabajo2.txt" using 2:($3*1.10-0.85) every ::66::199 with points ls 1, \
#"Ru0315mM-secuencia-continua-ventana-trabajo.txt" using 3:4 with lines ls 3, \


# "Ru0315mM-secuencia-continua-ventana-trabajo.txt" using 1:2 with points ls 1, \

#plot "Ru10mM/Ru10mM-ventana-preconcentracion3.txt" using ($1):($3) with points ls 1, \

#plot "Ru10mM/Ru10mM-ventana-preconcentracion3.txt" using ($2):($3) with points ls 1, \

#"Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using 1:2 with points ls 1, \
#"Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using ($1):($5) with lines ls 1, \