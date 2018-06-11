#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz tikzarrows
set output "ACV-ideal.tikz" 

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

set style line 1 lc rgb '#800000' lt 1 lw 2
set style line 2 lc rgb 'black' lt 1 lw 2
set style line 3 lc rgb '#ff4500' lt 1 lw 2
set style line 4 lc rgb '#ffa500' lt 1 lw 2
set style line 5 lc rgb '#006400' lt 1 lw 2
set style line 6 lc rgb '#0000ff' lt 1 lw 2
set style line 7 lc rgb '#9400d3' lt 1 lw 2


#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 15	 back ls 10 lw 1.5 
	#set border 2	 back ls 10 lw 1.5 

	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'red' lt 1 dashtype 2 lw 1.5
	#et grid back ls 11

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 500 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial vs referencia}$" font ",18" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{Intensidad de corriente}$"	   font ",18" textcolor rgb "gray20" offset -2,0

#Fuerza a establecer un rango
	 
	unset xtics
	unset ytics
#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 10
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10
	#set mytics 2

#FITEO
	#f(x) = a*x + b
	#fit f(x) "FIB_Au.txt" using 1:2 via a,b

	#stat "FIB_Au.txt" using 1:2

	#set label 1 sprintf("y=%3.3f",a) at 22,55 font "Times Italic,12" textcolor rgb "gray20"
	#set label 2 sprintf("+%3.3f",b) at 27,55 font "Times Italic,12" textcolor rgb "gray20"
	#set label 3 sprintf("R=%3.4f",STATS_correlation) at 22,52 font "Times Italic,12" textcolor rgb "gray20"
 
 
set xrange[-10:15]
set yrange[0:0.21]
#Ploteo todas las funciones que les digamos
Gauss(x,mu,sigma) = 1./(sigma*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sigma**2) )

set arrow 1 from 2,0 to 2,0.205 nohead ls 11
set label 1002 at 1.3,-0.011 "E$^\\circ$" font ",16" textcolor rgb 'black' front

f(x) = Gauss(x,2,2)


plot f(x) with lines ls 2, 

