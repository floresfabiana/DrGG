#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "Barrido_Vel_F127-CNEA-Calcinado-Fc1mM.tikz" 

#Saco la leyenda
set key top left Left reverse samplen 3 font ",10" textcolor rgb "gray40"

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
	set xlabel "$\\text{Tensión\\; vs\\; ESC/}mV$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$j/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-200:400]
	#set yrange [-100:100]

#Ploteo todas las funciones que les digamos
FILES = system("ls -1 fc-1mM-F127-AuCNEA-Calcinado/*.DTA")

plot for [data in FILES] data u ($3*1000):($4/0.0314*1e6) every ::1::655 with lines title columnheader