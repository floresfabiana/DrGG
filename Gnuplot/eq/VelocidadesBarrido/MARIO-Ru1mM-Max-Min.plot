#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "MARIO-Ru1mM-Max-Min.tikz"

#Separado por comas
set datafile sep','

#Saco la leyenda
	set key top left Left reverse samplen 3 font ",10" textcolor rgb "gray40"
#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Cuadrado
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lt 0 lc rgb 'black'  lw 3

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid front ls 11

#Coloca los nombre de los ejes
	set xlabel "log($\\nu$) $[\\text{mV.s}^{-1}]$"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "log(j) $[\\mu \\text{A.cm}^{-2}]$"	font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	
	set xrange [1.5:5]
	set yrange [1.5:4.5]
#FITEO
	 #f(x) = a*x + b  #Curva negra (anodica) bajas velocidades
	 #fit f(x) "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($4)) every ::0::5 via a,b
	 #stat "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($4))
	 #set label 1 sprintf("y=%3.3fX + %3.3f",a,b) at 1.8,0.2 font ",6" textcolor rgb "gray40"
	 #set label 2 sprintf("R=%3.4f",STATS_correlation) at 1.8,0.1 font ",6" textcolor rgb "gray40"

	 #i(x) = g*x + h  #Curva negra (anodica) altas velocidades
	 #fit i(x) "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($4)) every ::5::28 via g,h
	 #stat "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($4))
	 #set label 7 sprintf("y=%3.3fX + %3.3f",g,h) at 4,2.45font ",6" textcolor rgb "gray40"
	 #set label 8 sprintf("R=%3.4f",STATS_correlation) at 4,2.35 font ",6" textcolor rgb "gray40"


	  #g(x) = c*x + d #Curva roja (catodica) bajas velocidades
	  #fit g(x) "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($6)) every ::0::5 via c,d
	  #stat "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($6))
	  #set label 5 sprintf("y=%3.3fX + %3.3f",c,d) at 1.52,1.25 font ",6" textcolor rgb "gray40"
	  #set label 6 sprintf("R=%3.4f",STATS_correlation) at 1.52,1.15 font ",6" textcolor rgb "gray40"	

	  #h(x) = e*x + f #Curva roja (catodica) altas velocidades
	  #fit h(x) "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($6)) every ::5::28 via e,f
	  #stat "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($6))
	  #set label 3 sprintf("y=%3.3fX + %3.3f",e,f) at 4,1.75 font ",6" textcolor rgb "gray40"
	  #set label 4 sprintf("R=%3.4f",STATS_correlation) at 4,1.65 font ",6" textcolor rgb "gray40"	
 
	  z(x)=x+0.3
	  zz(x)=0.5*x+1.45 
	  set label 100 sprintf("$\\measuredangle = 1$") at 2.05,2.2 font ",12" textcolor rgb "black"
	  set label 101 sprintf("$\\measuredangle = 0,5$") at 4,3.3 font ",12" textcolor rgb "black"
	  
#plot "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($4)) title "Corriente \'anodica" ls 1, [1.6:2.15] f(x) with lines ls 1 notitle, [1.9:4.9] i(x) with lines ls 1 notitle, \
#"MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($6)) title "Corriente cat\'odica" ls 2, [1.6:2.13] g(x) with lines ls 2 notitle, [1.9:4.9]h(x) with lines ls 2 notitle

plot "MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($4/0.0314)) title "Corriente \'anodica" ls 1, \
"MARIO-Ru1mM-Max-Min-Corregido.csv" using (log10($1)):(log10($6/0.0314)) title "Corriente cat\'odica" ls 2, \
 [1.5:2.5] z(x) w l ls 4 notitle,[2:6] zz(x) w l ls 4 notitle 