#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "Adherencia_F127.tikz" 

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Para colocar flechas de tal posicion a tal otra
  	#set arrow from 0,0 to 0,62
  	#set arrow from 0,0 to 85,0

red_000 = "#670106"
red_025 = "#8d0000"
red_050 = "#bf0000"
red_075 = "#e30101"
red_100 = "#ff0000"

#Flecha
set style line 100  lc rgbcolor 'black' lw 1.5
set style arrow 200 head filled size screen 0.03,15 ls 100

#Defino estilos paset style line 2ra cada tipo de linea
	# set style line 1 lc rgbcolor red_000 pt 1 ps 2 lw 2
	# set style line 2 lc rgbcolor red_025 pt 1 ps 2 lw 2
	# set style line 3 lc rgbcolor red_050 pt 1 ps 2 lw 2
	# set style line 4 lc rgbcolor red_075 pt 1 ps 2 lw 2
	# set style line 5 lc rgbcolor red_100 pt 1 ps 2 lw 2
	# set style line 6 lc rgbcolor 'red' lt -1 pt -1
	set style line 1 lc rgb '#800000' lt 1 lw 1 #Marron
	set style line 2 lc rgb '#ff0000' lt 1 lw 1 #ROjo
	set style line 3 lc rgb '#ff4500' lt 1 lw 1 #Naranja
	set style line 4 lc rgb '#ffa500' lt 1 lw 2 #Amarillo
	set style line 5 lc rgb '#006400' lt 1 lw 2 #Verde
	set style line 6 lc rgb '#0000ff' lt 1 lw 2 #Azxul
	set style line 7 lc rgb '#9400d3' lt 1 lw 2 #Violeta
	set style line 8 lc rgb 'black' lt 1 dashtype 2 lw 2.5
	set style line 9 lc rgb 'gray30' lt 1 lw 1.5 #Negro


#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray50' lt 0 lw 1 
	set grid back ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ECS/}$mV" font ",14" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray20" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [-600:100]
	#set yrange [10:60]

#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 200
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 250
	#set mytics 2

#FITEO
	#f(x) = a*x + b
	#fit f(x) "FIB_Au.txt" using 1:2 via a,b

	#stat "FIB_Au.txt" using 1:2

	#set label 1 sprintf("y=%3.3f",a) at 22,55 font "Times Italic,12" textcolor rgb "gray20"
	#set label 2 sprintf("+%3.3f",b) at 27,55 font "Times Italic,12" textcolor rgb "gray20"
	#set label 3 sprintf("R=%3.4f",STATS_correlation) at 22,52 font "Times Italic,12" textcolor rgb "gray20"
 

#Ploteo todas las funciones que les digamos

#plot for [col=3:15] 'Adherencia_F127.txt' using 1:col with lines ls 1, 'Adherencia_F127.txt' u 1:2 with lines ls 8
#plot for [col=1:47] 'Adherencia_F127.txt' using 1:col with lines ls 9,

#plot 'Adherencia_F127.txt' u 1:2 with lines ls 9, 'Adherencia_F127.txt' u 1:12 with lines ls 8

#Pongo la leyenda
set key top left Left reverse samplen -2  font ",14" textcolor rgb "black" at -610,260


plot 'Adherencia_F127.txt' using 1:3 with lines ls 9 title "SF" ,\
'Adherencia_F127.txt' using 1:5 with lines ls 9 notitle ,\
'Adherencia_F127.txt' using 1:7 with lines ls 9 notitle ,\
'Adherencia_F127.txt' u 1:2 with lines ls 8 notitle ,\
'Adherencia_F127-flecha.txt' u 1:2 smooth bezier ls 100 notitle, 'Adherencia_F127-flecha.txt' u 5:6:7:8 w vectors arrowstyle 200 notitle ,\
'Adherencia_F127-flecha.txt' u 3:4 smooth bezier ls 100 notitle, 'Adherencia_F127-flecha.txt' u 9:10:11:12 w vectors arrowstyle 200 notitle	


 #"flecha.txt" u 3:4:($5*3):($6*3) w vectors arrowstyle 200
