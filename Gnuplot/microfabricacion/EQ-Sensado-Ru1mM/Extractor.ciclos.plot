#Para ver en pantalla
#reset
#set terminal X11

set size ratio 0.5

#Para exportar como latex
set terminal tikz
set output "APTES-10mM.tikz" 

#Saco la leyenda
	set key top right Left reverse sample -2 font ",10" textcolor rgb "gray20" 
	#unset key

#Saco el Borde
	unset border

# #Rectangulo, ventana de trabajo
 set style rect fc lt -1 fs solid 0.15 noborder
 set obj rect from 0, graph 0 to 60, graph 1
 set label at 20,1.6 "I" font ",14" textcolor rgb "black" front
 set label at 300,1.6 "II" font ",14" textcolor rgb "black" front
 

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 0.3 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray20' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray20' lt 0 lw 1 
set grid front ls 11

set ytics 0.5

#Coloca los nombre de los ejes
	set xlabel "N\'umero de ciclos"  font ",14" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{i}_p/\\text{i}_p^{\\text{Au}}$"	font ",14" textcolor rgb "gray20" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [0:400]
	#set yrange [10:60]


#Para graficar todas
	f(X)=1

  set print "DHDP-3mM-ciclos-45-90.txt" 
       do for [i=1:90:2] {
        stats [-400:-100]  "Zr-DHDP3mM45-90-Separados.txt" u i:(column(i+1)) nooutput ; 
         print (i-1)/2+1, STATS_pos_max_y, STATS_pos_min_y, STATS_min_y, STATS_max_y
       } 
       set print


#plot for [i=1:90:2] "Ru 1mM  en Zr 13x45 Rango Corto  (20_04_2017-16_44_14)/primero.txt" using i:(column(i+1)/0.0314) w l ls 2,\

#plot "APTES-I.txt" u ($1):($5/6.05) w p ls 1 title "ZSF - Ru \\SI{1}{\\milli\\Molar}", f(x) w l ls 2 notitle#
#[0:600] f(x) w l ls 2

#plot for [i=89:93:2] "MAXIMOS-TODOS.txt" using i:(column(i+1)) w l ls 2,\


