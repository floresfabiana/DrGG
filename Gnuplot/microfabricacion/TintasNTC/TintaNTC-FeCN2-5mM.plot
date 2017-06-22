#Para ver en pantalla
#reset
#set terminal X11
#set terminal aqua

#Para exportar como latex
set terminal tikz
set output "TintaNTC-FeCN2-5mM.tikz" 

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Defino estilos paset style line 2ra cada tipo de linea

	set style line 1 lc rgb 'black' lt 1 lw 2 
	set style line 3 lc rgb 'red' lt 1 lw 2
	set style line 2 lc rgb 'olive' lt 1 lw 2 

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray40' lt 0 lw 1 
	set grid back ls 11

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mxtics 10 

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [20:70]
	#set yrange [10:60]

#Ploteo todas las funciones que les digamos
plot "TintaNTC-FeCN2-5mM.txt" using ($1*1000):($2*1000) with lines ls 3, \
