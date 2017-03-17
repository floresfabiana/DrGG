#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "Ru0063mM.tikz" 

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
	set style line 111 lc rgb 'gray40' lt 0 lw 1 
	set grid back ls 111


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$j/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-600:100]
	#set yrange [10:60]

#Para graficar todas
plot for [i=1:3:2] 'Ru0063mM.txt' using i:(column(i+1)/0.0314) w lines ls 1, \
'Ru0063mM.txt' using 11:($12/0.0314) every ::5::1400 w lines ls 2, \
'Ru0063mM.txt' using 9:($10/0.0314) every ::5::1400  w lines ls 3
#"Au F127 INTI BajaT Ru1mM.txt" using ($3):($4/0.0314) every ::61633::63033  with lines ls 2, \
