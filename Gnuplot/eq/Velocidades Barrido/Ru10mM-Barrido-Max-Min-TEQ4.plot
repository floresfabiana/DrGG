#Para ver en pantalla
reset
set terminal x11

#Para exportar como latex
#set terminal tiRu10mM-Barrido-Max-Min-TEQ40mM-Barrido-Max-Min-TEQ4.tikz"

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid front ls 11

#Coloca los nombre de los ejes
	set xlabel "log(v) [mv/s]"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "log(i) [uA]"	font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [0:180]
#	set yrange [-1000:1000]
#FITEO
	f(x) = a*x + b
	fit f(x) "Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($3)) every ::7::11 via a,b
	stat "Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($3))
	set label 1 sprintf("y=%3.3fX + %3.3f",a,b) at 0.5,2.2 font ",15" textcolor rgb "gray40"
	set label 2 sprintf("R=%3.4f",STATS_correlation) at 0.5,2 font ",15" textcolor rgb "gray40"

	g(x) = c*x + d
	fit g(x) "Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($3)) every ::0::4 via c,d
	stat "Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($3))
	set label 5 sprintf("y=%3.3fX + %3.3f",c,d) at 0.5,1.8 font ",15" textcolor rgb "gray40"
	set label 6 sprintf("R=%3.4f",STATS_correlation) at 0.5,1.6 font ",15" textcolor rgb "gray40"	

	h(x) = e*x + f
	fit h(x) "Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($5)) every ::1::11 via e,f
	stat "Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($5))
	set label 3 sprintf("y=%3.3fX + %3.3f",e,f) at 1,2.2 font ",15" textcolor rgb "gray40"
	set label 4 sprintf("R=%3.4f",STATS_correlation) at 1,2 font ",15" textcolor rgb "gray40"	
 



#EL valor 4.01 corresponde al pico maximo en la oxidación.
plot "Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($3)) with points ls 1 , f(x) with lines ls 2, g(x) with lines ls 2\
#"Ru10mM-Barrido-Max-Min-TEQ4.txt" using (log10($1)):(log10($5)) with points ls 1, h(x) with lines ls 2\



#"Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using 1:2 with points ls 1, \
#"Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using ($1):($5) with lines ls 1, \