#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "onda-triangular.tikz" 

#Saco la leyenda
	unset key

#Saco el Borde
	#unset border

#Saco las marcas
  	#unset tics

#Para colocar flechas de tal posicion a tal otra
  	#set arrow from 0,0 to 0,62
  	#set arrow from 0,0 to 85,0

red_000 = "#670106"
red_025 = "#8d0000"
red_050 = "#bf0000"
red_075 = "#e30101"
red_100 = "#ff0000"


#Defino estilos paset style line 2ra cada tipo de linea
	# set style line 1 lc rgbcolor red_000 pt 1 ps 2 lw 2
	# set style line 2 lc rgbcolor red_025 pt 1 ps 2 lw 2
	# set style line 3 lc rgbcolor red_050 pt 1 ps 2 lw 2
	# set style line 4 lc rgbcolor red_075 pt 1 ps 2 lw 2
	# set style line 5 lc rgbcolor red_100 pt 1 ps 2 lw 2
	# set style line 6 lc rgbcolor 'red' lt -1 pt -1

set style line 1 lc rgb 'red' lt 1 lw 2
set style line 2 lc rgb '#ff0000' lt 1 lw 2
set style line 3 lc rgb 'black' lt 1 lw 2
set style line 4 lc rgb '#ffa500' lt 1 lw 2
set style line 5 lc rgb '#006400' lt 1 lw 2
set style line 6 lc rgb '#0000ff' lt 1 lw 2
set style line 7 lc rgb '#9400d3' lt 1 lw 2


#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Fuerza a establecer un rango
	 
	set xrange [0:2]
	set yrange [-1.2:1.2]

	unset xtics
    unset ytics

#Coloca los nombre de los ejes
set xlabel "tiempo" font ",18" textcolor rgb "gray40" offset  0,-2
set ylabel "potencial" font ",18" textcolor rgb "gray40" offset  -2,0

set label 1001 at  -0.15,1 "E$_2$" font ",16" textcolor rgb 'black' front
set label 1002 at  -0.15,-1 "E$_1$" font ",16" textcolor rgb 'black' front

#Ploteo todas las funciones que les digamos
plot "onda-triangular.txt" using 1:2 with lines ls 3
