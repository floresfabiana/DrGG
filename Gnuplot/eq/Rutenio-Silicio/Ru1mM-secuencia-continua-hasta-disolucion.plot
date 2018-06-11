#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "Ru1mM-secuencia-continua-hasta-disolucion.tikz" 
#load '../../gnuplot-palettes-master/plasma.pal'

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics
set style line 1 lc rgb 'gray50' lt 1 lw 0.5 #Marron
set style line 2 lc rgb 'red' lt 1 lw 1 #ROjo
set style line 3 lc rgb 'blue' lt 1 lw 1 #Azul

#Flecha
set style line 100  lc rgbcolor 'black' lw 1.5
set style arrow 200 head filled size screen 0.02,10 ls 100

#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray50' lt 0 lw 1 
	set grid back ls 111

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{j/}\\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray20" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-600:100]
	#set yrange [10:60]

#Letendas
set label 100 sprintf("+ciclos") at -280,280 font ",10" textcolor rgb "black"
set label 101 sprintf("+ciclos") at -280,-350 font ",10" textcolor rgb "black"

#Para graficar todas
plot for [i=1:5:2] 'Ru1mM-secuencia-continua-hasta-disolucion.txt' using i:(column(i+1)/0.0314) every 5 w lines ls 1, \
'Ru1mM-secuencia-continua-hasta-disolucion.txt' using 3:($4/0.0314) every 5::21000::22400 w lines ls 3,\
'Ru1mM-secuencia-continua-hasta-disolucion.txt' using 5:($6/0.0314) every 5::63000::64400 w lines ls 2,\
"flecha-ru1mM.txt" u 1:2 smooth bezier ls 100,\
"flecha2-ru1mM.txt" u 1:2 smooth bezier ls 100,\
"flecha-ru1mM.txt" u 3:4:5:6 w vectors arrowstyle 200,\
"flecha2-ru1mM.txt" u 3:4:5:6 w vectors arrowstyle 200,\
 #"flecha.txt" u 3:4:($5*3):($6*3) w vectors arrowstyle 200 #"flecha.txt" with points
