#Para ver en pantalla
#reset
#set terminal X11
#set terminal aqua

#Para exportar como latex
set terminal tikz
set output "Ru-F127-INTI-BajaT-0-1.tikz" 

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


#Defino estilos paset style line 2ra cada tipo de linea
	# set style line 1 lc rgbcolor red_000 pt 1 ps 2 lw 2
	# set style line 2 lc rgbcolor red_025 pt 1 ps 2 lw 2
	# set style line 3 lc rgbcolor red_050 pt 1 ps 2 lw 2
	# set style line 4 lc rgbcolor red_075 pt 1 ps 2 lw 2
	# set style line 5 lc rgbcolor red_100 pt 1 ps 2 lw 2
	# set style line 6 lc rgbcolor 'red' lt -1 pt -1
	set style line 1 lc rgb 'salmon30' lt 1 lw 0.1 #Marron
	set style line 2 lc rgb 'red' lt 1 lw 3 #ROjo
	set style line 3 lc rgb '#ff4500' lt 1 lw 2 #Naranja
	set style line 4 lc rgb '#ffa500' lt 1 lw 2 #Amarillo
	set style line 5 lc rgb '#006400' lt 1 lw 2 #Verde
	set style line 6 lc rgb '#0000ff' lt 1 lw 2 #Azxul
	set style line 7 lc rgb '#9400d3' lt 1 lw 2 #Violeta

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray40' lt 0 lw 1 
	set grid back ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$j/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	 
	set xrange [-600:100]
	set yrange [-150:100]

#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 10
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10
	#set mytics 2

#FITEO
	#f(x) = a*x + b
	#fit f(x) "datos.txt" using ($4):($2*1e6) via a,b
	#g(x) = c*x + d
	#fit g(x)"datos.txt" using ($4):($3*1e6) via c,d
	#stat "ConcentracionesCal.txt" using 1:2 

	#set label 1 sprintf("y=%3.3f",a) at 22,55 font "Times Italic,12" textcolor rgb "gray40"
	#set label 2 sprintf("+%3.3f",b) at 27,55 font "Times Italic,12" textcolor rgb "gray40"
	#set label 3 sprintf("R=%3.4f",STATS_correlation) at 22,52 font "Times Italic,12" textcolor rgb "gray40"
 	
 # 	stat "ConcentracionesCal.txt" using ($1*1000):($3*1e6) 

 # 	set label 1 sprintf("y=%3.3f",a) at 22,55 font "Times Italic,12" textcolor rgb "gray40"
	# set label 2 sprintf("+%3.3f",b) at 27,55 font "Times Italic,12" textcolor rgb "gray40"
	# set label 3 sprintf("R=%3.4f",STATS_correlation) at 22,52 font "Times Italic,12" textcolor rgb "gray40"

 

#Ploteo todas las funciones que les digamos
plot "Au F127 INTI BajaT Ru0.1mM.txt" using ($1):($2/0.0314)  every 2 with lines ls 1, \
"Au F127 INTI BajaT Ru0.1mM.txt" using ($3):($4/0.0314) every ::1::1400 with lines ls 2, \

#plot "Au F127 INTI BajaT Ru0.1mM.txt" using ($1):($2/0.0314) with lines ls 1, \
#"Au F127 INTI BajaT Ru0.1mM.txt" using ($3):($4/0.0314)  with lines ls 1, \

