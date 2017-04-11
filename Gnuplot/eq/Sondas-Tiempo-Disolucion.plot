#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "Sondas-Tiempo-Disolucion.tikz"
 
#leyenda
set key top left Left reverse font ",8" textcolor rgb "gray40"

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'blue' pt 7 ps 1 lw 1#Cuadrado 9 #Triangulo 
set style line 4 lc rgb 'green' pt 7 ps 1 lw 1#Cuadrado

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid front ls 11

#Coloca los nombre de los ejes
	set xlabel "tiempo / min"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{I}_p^{np}/\\text{I}_p^{\\text{Au}}$"	font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
#	set xrange [0:41]
#	set yrange [-1000:1000]

plot "Sondas en el tiempo.txt" u 1:2 with points ls 1 title "AR",\
"Sondas en el tiempo.txt" u 4:5 with points ls 2 title "FcOH",\
"Sondas en el tiempo.txt" u 7:8 with points ls 3 title "FCN",\
"Sondas en el tiempo.txt" u 10:11 with points ls 4 title "HQ"
