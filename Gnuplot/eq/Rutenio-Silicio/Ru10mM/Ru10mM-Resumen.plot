#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "Ru10mM-Resumen.tikz"

#Saco la leyenda
set key top left Left reverse samplen 2.5 spacing 2.1 font ",14" textcolor rgb "black" at -500,1400 


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
	set style line 1 lc rgb 'gray50' lt 1 lw 0.5 #Gris
	set style line 2 lc rgb 'black' lt 1 dashtype 2 lw 2.5 #Rojo
	set style line 5 lc rgb 'gray50' lt 1 lw 2.5 #Azul
	set style line 3 lc rgb 'black' lt 1 lw 2.5 #Azul

	#set style line 1 lc rgb '#800000' lt 1 lw 2 #Marron
	#set style line 2 lc rgb '#ff0000' lt 1 lw 2 #ROjo
	#set style line 3 lc rgb '#ff4500' lt 1 lw 2 #Naranja
	set style line 4 lc rgb '#ffa500' lt 1 lw 2 #Amarillo
	set style line 8 lc rgb 'black' lt 1 dashtype 7 lw 1.5 #Rojo	
	set style line 6 lc rgb '#0000ff' lt 1 lw 2 #Azxul
	set style line 7 lc rgb '#9400d3' lt 1 lw 2 #Violeta

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror font ",14"

#Estilo de la grilla
set style line 11 lc rgb 'gray70' lt 0 lw 1 
set grid back ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-500:]
	set xtics offset 0,-0.4
#	set yrange [-1000:1000]

#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 10
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 250	
	#set mytics 2


#Ploteo todas las funciones que les digamos

plot 'Ru10mM-Resumen.txt' using 1:($2/0.0314) w lines ls 3 title "SF (adsorbido)", \
'Ru10mM-Resumen.txt' using 3:($4/0.0314) w lines ls 5 title "SF (libre+ads)", \
'Ru10mM-Resumen.txt' using 5:($6/0.0314) w lines ls 2 title "Au"
#plot for [i=1:5:2] 'Ru10mM-Resumen.txt' using i:i+1 w lines title sprintf("column %d", i)
