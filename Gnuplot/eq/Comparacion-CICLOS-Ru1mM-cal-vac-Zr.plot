#Para ver en pantalla
#reset
#set terminal X11

#set size ratio 0.5

#Para exportar como latex
set terminal tikz
set output "Comparacion-CICLOS-Ru1mM-cal-vac-Zr.tikz" 

#Saco la leyenda
	#set key top right Left reverse sample -2 font ",10" textcolor rgb "gray40" 
	unset key

#Saco el Borde
	unset border

# #Rectangulo, ventana de trabajo
 set style rect fc lt -1 fs solid 0.15 noborder
 #et obj rect from 0, graph 0 to 60, graph 1
 #set label at 20,1.6 "I" font ",14" textcolor rgb "black" front
 #set label at 300,1.6 "II" font ",14" textcolor rgb "black" front
 

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 0.5 lw 1#Cuadrado
set style line 2 lc rgb 'olive' pt 7 ps 0.5  #Circulo
set style line 3 lc rgb 'blue' lw 2 pt 7 ps 0.5 #Triangulo 
set style line 4 lc rgb 'red' pt 7 ps 1 lw 2 #Circulo

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror font ",14"

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid front ls 11

set ytics 0.5

#Coloca los nombre de los ejes
	set xlabel "N\'umero de ciclos"  font ",16" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{i}_p/\\text{i}_p^{\\text{Au}}$"	font ",16" textcolor rgb "gray40" offset -2,0


#Fuerza a establecer un rango
	 
	#set xrange [0:400]
	set yrange [0:2.5]
	set xtics offset 0,-0.3

#Para graficar todas
	f(X)=1

  # set print "Ru1mM-CNEA-calcinado-numero-de-ciclos-vs-i.txt" 
  #      do for [i=1:720:2] {
  #       stats [-400:-100]  "MAXIMOS-TODOS.txt" u i:(column(i+1)) nooutput ; 
  #        print (i-1)/2+1, STATS_pos_max_y, STATS_pos_min_y, STATS_min_y, STATS_max_y
  #      } 
  #      set print
#Leyenda
   set label at 95,1.8 "CalSF"  font ",12" front textcolor rgb "olive" 
   set label at 95,1.3 "VacSF"  font ",12" front textcolor rgb "blue"
   set label at 95,2.15 "VacSZF"  font ",12" front textcolor rgb "black"
   

#plot for [i=1:90:2] "Ru 1mM  en Zr 13x45 Rango Corto  (20_04_2017-16_44_14)/primero.txt" using i:(column(i+1)/0.0314) w l ls 2,\

plot "Rutenio-Silicio/Ru1mM-CNEA-Calcinado/Ru1mM-CNEA-calcinado-numero-de-ciclos-vs-i.txt" u ($4*(-1)/5.8) w p ls 2 title "SF Calcinado - Ru \\SI{1}{\\milli\\Molar}",\
"Zirconia/Ru1mM-RangoCorto/Zr-Ru1mM-IvsCiclos.txt" u ($1):($5/6.05) w p ls 1 title "ZSF - Ru \\SI{1}{\\milli\\Molar}",\
"Rutenio-Silicio/Ru1mM-secuencia-continua-hasta disolucion-ventana-trabajo.txt" using ($1):($3/4.21) with points ls 3 title "SF Vacio", \
f(x) w l ls 4 notitle


#[0:600] f(x) w l ls 2

#plot for [i=89:93:2] "MAXIMOS-TODOS.txt" using i:(column(i+1)) w l ls 2,\


