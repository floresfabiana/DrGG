#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "Calibracion_HQ.tikz"

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
	set style line 1 lc rgb 'gray40' pt 7 ps 1 lw 1#Cuadrado
	set style line 2 lc rgb 'gray40' pt 7 ps 1  #Circulo
	set style line 3 lc rgb 'black' pt 7 ps 9 #Triangulo 
	set style line 4 lc rgb 'red' lt -1 pt -1
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
	set xlabel "$\\text{Concentración/mV}$"	font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$j/ \\mu \\text{A.cm}^{-2}$" font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [0:]
	#set yrange [10:60]

#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 10
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	set ytics 1000
	#set mytics 2

#FITEO
	f(x) = a*x + b
	fit f(x) "Calibracion_HQ.txt" using ($1):($2/0.0314) via a,b
	
	stat "Calibracion_HQ.txt" using 1:2

	set label 1 sprintf("y=%3.3f %3.3f",a,b) at 0.2,2800 font ",10" textcolor rgb "gray40"
	set label 2 sprintf("R=%3.4f",STATS_correlation) at 0.2,2500 font ",10" textcolor rgb "gray40"
 

#Ploteo todas las funciones que les digamos

plot "Calibracion_HQ.txt" using ($1):($2/0.0314) with points ls 1, f(x) with lines ls 4