#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "Ru1mM.tikz" 

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

set style line 1 lc rgb 'gray70' lt 1 lw 0.5 #Marron
set style line 2 lc rgb 'red' lt 1 lw 2.5 #ROjo
set style line 3 lc rgb 'blue' lt 1 lw 2.5 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray70' lt 0 lw 1 
	set grid back ls 111


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ECS/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-600:100]
	#set yrange [10:60]

#Para graficar todas
plot "Ru1mM-secuencia-continua-hasta-disolucion.txt" using 1:($2/0.0314) every 2 with lines ls 1,\
"Ru1mM-secuencia-continua-hasta-disolucion.txt" using 3:($4/0.0314) every ::1::1400 with lines ls 3,\
"Ru1mM-secuencia-continua-hasta-disolucion.txt" using 7:($8/0.0314) every ::63000::64400 with lines ls 2,\