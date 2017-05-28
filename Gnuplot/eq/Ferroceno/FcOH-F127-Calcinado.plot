#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "FcOH-F127-Calcinado.tikz" 

#Para hacer los inset
set multiplot

#Saco la leyenda
set key bottom right Left reverse samplen 3 font ",10" textcolor rgb "gray40" at 370,-700

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics
#Defino estilos paset style line 2ra cada tipo de linea
	set style line 1 lc rgb '#E5BC00' pt 1 ps 2 lw 2
	set style line 2 lc rgb '#DE9C05' pt 1 ps 2 lw 2
	set style line 3 lc rgb '#D87D0B' pt 1 ps 2 lw 2
	set style line 4 lc rgb '#D25E10' pt 1 ps 2 lw 2
	set style line 5 lc rgb '#CB3E16' pt 1 ps 2 lw 2
	set style line 6 lc rgb '#C51F1B' pt 1 ps 2 lw 2
	set style line 7 lc rgb '#BF0012' pt 1 ps 2 lw 2
	set style increment user

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

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-200:400]
	#set yrange [-100:100]

#plot "fc-10mM-F127-AuCNEA-Calcinado/1-FeOH-1mM-20.DTA" u ($3*1000):($4/0.0314*1e6) every ::1::655 with lines title columnheader,\
#"fc-10mM-F127-AuCNEA-Calcinado/2-FeOH-1mM-50.DTA" u ($3*1000):($4/0.0314*1e6) every ::1::655 with lines title columnheader,\

#Ploteo todas las funciones que les digamos
FILES = system("ls -1 fc-1mM-F127-AuCNEA-Calcinado/*.txt")

plot for [data in FILES] data u ($3*1000):($4/0.0314*1e6) every ::1::655 with lines title columnheader

# Now we set the options for the smaller plot
  set size 0.4,0.4
  set origin 0.12,0.58
  set object 1 rectangle from graph 0,0 to graph 1,1 behind fc rgb "white"
  #set object 1 rectangle from screen 0.2,0.6 to screen 0.5,0.9 fillcolor rgb "green"
  set xrange [-200:400]
  #set xtics 100
  set yrange [-150:150]
  set border 15
  unset grid
  set xlabel ""
  set xtics font ", 6"
  set ytics font ", 6"
  set ylabel ""
  set xtics 200
  set ytics 150
  unset label
  unset arrow
  unset key
  #set label "\\tiny{LO}$_3$" at 1280,0.55 font ",8" textcolor rgb "gray40"
  #set label "\\tiny{LO}$_4$" at 1210,0.525 font ",8" textcolor rgb "gray40"
  plot "fc-1mM-F127-AuCNEA-Calcinado/1-FeOH-1mM-20.DTA.txt" using ($3*1000):($4/0.0314*1e6) every ::1::655 with lines ls 1
unset multiplot