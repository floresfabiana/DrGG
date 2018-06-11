#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz 
set output "CV_ideal-au.tikz" 


#Saco la leyenda
	unset key

set style line 1 lc rgb 'black' lt 1 lw 2

#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 15	 back ls 10 lw 1.5 
	#set border 2	 back ls 10 lw 1.5 

	set tics nomirror

	 
	set xrange [-300:690]
	set yrange [-2000:2200]

	unset xtics
unset ytics


plot "CV_ideal.txt" using ($1*1000+183):($3*1e6/0.0025) with lines ls 1