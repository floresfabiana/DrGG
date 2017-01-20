#Para ver en pantalla
reset
set terminal X11

#Para exportar como latex
#set terminal tikz
#set output "ExclusionFcCN.tikz" 

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
	set style line 1 lc rgb '#800000' lt 1 lw 2 #Marron
	set style line 2 lc rgb '#ff0000' lt 1 lw 2 #ROjo
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
	 
	#set xrange [:600]
	#set yrange [10:60]

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
plot "CTAB-Ru1mM.DTA-Ciclo-1.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-2.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-3.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-4.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-5.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-6.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-7.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-8.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-9.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-10.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-11.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-12.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-13.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-14.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-15.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-16.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-17.txt" using ($1):($2/0.0314) with lines ls 5, \
 "CTAB-Ru1mM.DTA-Ciclo-18.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-20.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-21.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-22.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-23.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-24.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-25.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-26.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-27.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-28.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-29.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-30.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-31.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-32.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-33.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-34.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-35.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-36.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-37.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-38.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-39.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-40.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-41.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-42.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-43.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-44.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-45.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-46.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-47.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM.DTA-Ciclo-48.txt" using ($1):($2/0.0314) with lines ls 5, \
"CTAB-Ru1mM-50ciclos.DTA-Ciclo-1.txt" using ($1):($2/0.0314) with lines ls 1,\
"CTAB-Ru1mM-50ciclos.DTA-Ciclo-49.txt" using ($1):($2/0.0314) with lines ls 6, \
"CTAB-Ru1mM-control.txt" using ($3):($4/0.0314) with lines ls 2