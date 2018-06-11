#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "Comparacion-exp-simulado.tikz" 

#Saco la leyenda
set key bottom right Left reverse sample 2 font ",14" textcolor rgb "gray20" 

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics
set style line 1 lc rgb 'brown' lt 1 lw 1.5 #Marron
set style line 2 lc rgb 'red' lt 1 lw 1.5 #ROjo
set style line 3 lc rgb 'blue' lt 1 lw 1.5 #Azul
set style line 5 lc rgb 'orange' lt 1 lw 1.5 #naranja
set style line 6 lc rgb 'black' lt 1 lw 1.5 #verde
set style line 7 lc rgb 'black' lt 1 dashtype 2 lw 1.5

#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray50' lt 0 lw 1 
	set grid back ls 111

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ECS/mV}$" font ",14" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray20" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-600:600]
	#set yrange [10:60]

#Para graficar todas
plot "../Simulaciones/simulacion-K0-Dfc.txt" u ($1*1000*1.10+15):($3-50) with lines ls 7 title "simulación",\
"MediacionFC-4.txt" using 1:($2/0.0314) w lines ls 6 title "experimental"