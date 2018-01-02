#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "Ru1mM-secuencia-continua-hasta-disolucion-ventana-trabajo.tikz"

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

# #Rectangulo, ventana de trabajo
 set style rect fc lt -1 fs solid 0.15 noborder
 set obj rect from 60, graph 0 to 75, graph 1
 set label at 20,1.5 "I" font ",14" textcolor rgb "black" front
 set label at 62.5,1.5 "II" font ",14" textcolor rgb "black" front
 set label at 140,1.5 "III" font ",14" textcolor rgb "black" front

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 0.5 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror font ",14"

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid front ls 11

#Coloca los nombre de los ejes
	set xlabel "N\'umero de ciclos"  font ",16" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{i}_p/\\text{i}_p^{\\text{Au}}$"	font ",16" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [0:180]
		set xtics offset 0,-0.3

#	set yrange [-1000:1000]

#EL valor 4.01 corresponde al pico maximo en la oxidación. #4.21 mas apropoiado
plot "Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using ($1):($3/4.21) with points ls 1, \
"Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using ($1):($5/4.01) with lines ls 3, \
