#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz 
set output "CV_ideal-pdmza1.tikz" 

#Saco la leyenda
	unset key

set style line 1 lc rgb 'black' lt 1 lw 2

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 15	 back ls 10 lw 1.5 
	#set border 2	 back ls 10 lw 1.5 

	set tics nomirror
 	set yrange[-1.5:1]

	unset xtics
	unset ytics

plot "CV_ideal-pdmza1.txt" using 5:6 every ::7000::8400 with lines ls 1