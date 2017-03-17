#Para ver en pantalla
reset
set terminal x11

#Para exportar como latex
#set terminal tikz
#set output "Ru-1mM-Barrido-Max-Min-EQMARIO.tikz"

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
	set xlabel "Log de la velocidad de barrido"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "log de la intensidad"	font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [1.5:5]
	set yrange [0:2.5]
#FITEO
	 f(x) = a*x + b
	 fit f(x) "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($3)) every ::0::4 via a,b
	 stat "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($3))
	 set label 1 sprintf("y=%3.3fX + %3.3f",a,b) at 1.8,2 font ",15" textcolor rgb "gray40"
	 set label 2 sprintf("R=%3.4f",STATS_correlation) at 1.8,2.1 font ",15" textcolor rgb "gray40"

	 i(x) = g*x + h
	 fit i(x) "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($3)) every ::5::28 via g,h
	 stat "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($3))
	 set label 7 sprintf("y=%3.3fX + %3.3f",g,h) at 4.5,2 font ",15" textcolor rgb "gray40"
	 set label 8 sprintf("R=%3.4f",STATS_correlation) at 4.5,1.9 font ",15" textcolor rgb "gray40"


	  g(x) = c*x + d
	  fit g(x) "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($5)) every ::1::3 via c,d
	  stat "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($5))
	  set label 5 sprintf("y=%3.3fX + %3.3f",c,d) at 2.2,0.5 font ",15" textcolor rgb "gray40"
	  set label 6 sprintf("R=%3.4f",STATS_correlation) at 2.2,0.4 font ",15" textcolor rgb "gray40"	

	  h(x) = e*x + f
	  fit h(x) "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($5)) every ::5::28 via e,f
	  stat "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($5))
	  set label 3 sprintf("y=%3.3fX + %3.3f",e,f) at 3.5,2.2 font ",15" textcolor rgb "gray40"
	  set label 4 sprintf("R=%3.4f",STATS_correlation) at 3.5,2.1 font ",15" textcolor rgb "gray40"	
 



#EL valor 4.01 corresponde al pico maximo en la oxidación.
#
#plot "Barrido-Ru1mM-Max-Min.txt" using (log10($1)):(log10($3)) with points ls 1, f(x) with lines ls 2
# plot "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($3)) with points ls 1, f(x) with lines ls 2, \
# "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($5)) with points ls 1, g(x) with lines ls 2, h(x) with lines ls 2
plot "Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($3)), f(x) with lines ls 2, i(x) with lines ls 2, \
"Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($5)), g(x) with lines ls 2, h(x) with lines ls 2\
#"Ru-1mM-Barrido-Max-Min-EQMARIO.txt" using (log10($1)):(log10($5)), \
#f(x) with lines ls 2, g(x) with lines ls 2, h(x) with lines ls 2