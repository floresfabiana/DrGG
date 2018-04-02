#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "Comparacion_F127-MPTMS.tikz" 

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Defino estilos paset style line 2ra cada tipo de linea
	# set style line 1 lc rgbcolor red_000 pt 1 ps 2 lw 2
	# set style line 2 lc rgbcolor red_025 pt 1 ps 2 lw 2
	# set style line 3 lc rgbcolor red_050 pt 1 ps 2 lw 2
	# set style line 4 lc rgbcolor red_075 pt 1 ps 2 lw 2
	# set style line 5 lc rgbcolor red_100 pt 1 ps 2 lw 2
	# set style line 6 lc rgbcolor 'red' lt -1 pt -1
	set style line 1 lc rgb 'red' lt 1 lw 1 #Marron
	set style line 2 lc rgb 'black' lt 1 lw 1 #ROjo
	set style line 3 lc rgb 'gray25' lt 1 lw 1 #Naranja
	set style line 4 lc rgb '#ffa500' lt 1 lw 2 #Amarillo
	set style line 5 lc rgb '#006400' lt 1 lw 2 #Verde
	set style line 6 lc rgb '#0000ff' lt 1 lw 2 #Azxul
	set style line 7 lc rgb '#9400d3' lt 1 lw 2 #Violeta


#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray70' lt 0 lw 1 
	set grid back ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"

#Flecha
set style line 100  lc rgbcolor 'black' lw 1.5
set style arrow 200 head filled size screen 0.02,10 ls 100

#Letendas
set label 100 sprintf("+ciclos") at -280,300 font ",10" textcolor rgb "black"
set label 101 sprintf("+ciclos") at -305,-420 font ",10" textcolor rgb "black"

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ECS/}$mV" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [-600:100]
	#set yrange [10:60]

#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 200
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 250
	#set mytics 2

#Pongo la leyenda
#Pongo la leyenda
set key top left Left reverse samplen -2  font ",14" textcolor rgb "black" at -610,360
 

#Ploteo todas las funciones que les digamos

plot 'Adherencia/F127-MPTMS-135 cilclos.txt' u 5:($6/0.0314) every 2 w l ls 3 title "SF",\
"Adherencia/flecha-ru1mM.txt" u 1:2 smooth bezier ls 100  notitle,\
"Adherencia/flecha2-ru1mM.txt" u 1:2 smooth bezier ls 100 notitle,\
"Adherencia/flecha-ru1mM.txt" u 3:4:5:6 w vectors arrowstyle 200 notitle,\
"Adherencia/flecha2-ru1mM.txt" u 3:4:5:6 w vectors arrowstyle 200 notitle,\

#"Adherencia/flecha-ru1mM.txt" u 1:2 w p ls 100  notitle,\