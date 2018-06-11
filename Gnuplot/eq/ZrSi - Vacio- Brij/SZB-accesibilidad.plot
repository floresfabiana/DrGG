#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "SZB-accesibilidad.tikz" 

#Saco la leyenda
	set key reverse samplen -1 font ",14" textcolor rgb "black" at -400,375

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics
set style line 1 lc rgb 'black' lt 1 lw 0.5 #Marron
set style line 2 lc rgb 'red' lt 1 lw 2.5 #ROjo
set style line 3 lc rgb 'blue' lt 1 lw 2.5 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror  font ",16" textcolor rgb 'gray20'
	set xtics offset 0,-0.5

#Estilo de la grilla
	set style line 111 lc rgb 'gray50' lt 0 lw 1 
	set grid back ls 111

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ECS/mV}$" font ",18" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",18" textcolor rgb "gray20" offset -3.5,0

#Fuerza a establecer un rango
	 
	set xrange [-500:0]
	set yrange [-500:400]


#Para graficar todas

plot "Sobre sustrato de Si RU 1mM  SEgunda prueba  3  (25_09_2017-12_57_42)/terxera.txt" using 1:($2/0.0314) every ::14000::15000 w l ls 1 title "VacSZB",\

#"../Control_Au/Ru 1mM Au Rango Cort.txt" u 1:($2/0.0314) every ::4800::6000 w l ls 2,\
#"../../Rutenio-Silicio/Ru1mM-secuencia-continua-hasta-disolucion.txt" using 1:($2/0.0314) every 2 with lines ls 5,\
#"../../Rutenio-Silicio/Ru1mM-secuencia-continua-hasta-disolucion.txt" using 3:($4/0.0314) every ::1::1400 with lines ls 3,\
#"../../Rutenio-Silicio/Ru1mM-secuencia-continua-hasta-disolucion.txt" using 7:($8/0.0314) every ::63000::64400 with lines ls 2 ,\