#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "Ru10mM-ventana-preconcentracion.tikz"

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics
# #Rectangulo, ventana de trabajo
 set style rect fc lt -1 fs solid 0.15 noborder
 set obj rect from 35, graph 0 to 55, graph 1
 set label at 10,1.1 "I" font ",14" textcolor rgb "black" front
 set label at 41,1.1 "II" font ",14" textcolor rgb "black" front
 set label at 125,1.1 "III" font ",14" textcolor rgb "black" front


#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 0.5 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray20' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror font ",16" textcolor rgb "gray20"
	set xtics offset 0,-0.8

#Estilo de la grilla
set style line 11 lc rgb 'gray50' lt 0 lw 1 
#unset grid
set grid front ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"

#Coloca los nombre de los ejes
	set xlabel "N\'umero de ciclos"  font ",18" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{i}_p/\\text{i}_p^{\\text{Au}}$"	font ",18" textcolor rgb "gray20" offset -3.2,0

#Fuerza a establecer un rango
	 
	set xrange [0:140]
	set xtics offset 0,-0.3
#	set yrange [-1000:1000]

#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 10
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 250	
	#set mytics 2


#Ploteo todas las funciones que les digamos


plot "Ru10mM-ventana-preconcentracion3.txt" using ($1):($3) every ::1::110 with points ls 1, \
"Ru10mM-ventana-preconcentracion.txt" using ($3):($4) with lines ls 3
#"Calibracion_Fc.txt" using ($1):($3) with  points ls 1, f(x) with lines ls 4, g(x) with lines ls 4
