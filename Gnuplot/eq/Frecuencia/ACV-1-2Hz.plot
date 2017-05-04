#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "ACV-1-2Hz.tikz" 

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics
set style line 1 lc rgb 'gray70' lt 1 lw 0.5 #Marron
set style line 2 lc rgb 'red' lt 1 lw 1 #ROjo
set style line 3 lc rgb 'blue' lt 1 lw 1 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 	
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray40' lt 0 lw 1 
	set grid back ls 111

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-600:100]
	set yrange [0:250]


#Para graficar todas
plot "ACV-Filtrados.txt" using 1:(($2+0.1)/0.0314) every ::3::349 with lines ls 3, "ACV-Filtrados.txt" every ::5::700 using 3:(($4-0.6)/0.0314) with lines ls 2