#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "langmuir.tikz"

#Saco la leyenda
	set key bottom right Left reverse samplen -1 font ",14" textcolor rgb "gray40" 


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


#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 9 ps 1.5  #Circulo
set style line 3 lc rgb 'black' pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

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

#Coloca los nombre de los ejes
	set xlabel "$\\text{Concentraci\'on en la soluci\'on/mM}$"	font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "Concentraci\'on en la pel\'icula / M" font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
#	set xrange [0:]
#	set yrange [-1000:1000]

#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 10
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 250	
	#set mytics 2

#FITEO
	f(x) = x*c/(x+a)+b
	fit f(x) "langmuir.txt" using ($1):($2) via a,b,c
	
	#f(x) = x/(c*x+a)+b
	#fit f(x) "Ru Lagmuir.txt" using ($1):($2) via a,b,c
	stat "langmuir.txt" using 1:2

	g(x) = x/(x+d)+e
	fit g(x) "langmuir.txt" using ($1):($3) via d,e
	
	#g(x) = x/(f*x+d)+e
	#fit g(x) "Ru Lagmuir.txt" using ($1):($3) via d,e,f
	stat "langmuir.txt" using 1:3

	# set label 1 sprintf("y=%3.3f+%3.3f",a,b) at 0.2,925 font ",10" textcolor rgb "gray40"
	# set label 2 sprintf("R=%3.4f",STATS_correlation) at 0.2,800 font ",10" textcolor rgb "gray40"

	# g(x) = c*x + d
	# fit g(x) "Calibracion_Fc.txt" using ($1):($3) via c,d
	# stat "Calibracion_Fc.txt" using 1:3

	# set label 3 sprintf("y=%3.3f %3.3f",c,d) at 0.2,-825 font ",10" textcolor rgb "gray40"
	# set label 4 sprintf("R=%3.4f",STATS_correlation) at 0.2,-950 font ",10" textcolor rgb "gray40"
 	

#Ploteo todas las funciones que les digamos

plot "langmuir.txt" using ($1):($2) with points ls 1  title "Corriente \'anodica" ,f(x) with lines ls 3 notitle, \
"langmuir.txt" using ($1):($3) with points ls 2 title "Corriente cat\'odica",g(x) with lines ls 4 notitle
#"Calibracion_Fc.txt" using ($1):($3) with  points ls 1, f(x) with lines ls 4, g(x) with lines ls 4
