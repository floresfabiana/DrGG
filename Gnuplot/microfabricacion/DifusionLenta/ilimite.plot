#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "ilimite.tikz" 

#Saco la leyenda
	set key top right Left sample -1 spacing 2 reverse font ",10" textcolor rgb "black" 

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

set style line 1 lc rgb 'gray60' pt 9 lt 1 ps 1.2 lw 0.5 #Marron
set style line 2 lc rgb 'red' pt 7 lt 1 ps 0.80 lw 2.5 #ROjo
set style line 3 lc rgb 'blue' pt 5 lt 1 ps 0.80 lw 1 #Azul
set style line 5 lc rgb 'black' pt 13 lt 1 ps 1.2 lw 1 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray40' lt 0 lw 1 
	set grid back ls 111


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set xtics 15
	#set mytics 2 
	set yrange[-10:10]
	set ytics 5

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\Delta E$ /mV" font ",16" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{log}(i_{lim}/i_s)$"	   font ",16" textcolor rgb "gray40" offset -2,0


plot "ilimite.txt" u ($1*1000):2 ls 2 title "$D_e=10^{-4}\\text{cm}^{-2}.\\text{s}^{-1}$",\
"ilimite.txt" u ($1*1000):3 ls 3 title "$D_e=10^{-6}\\text{cm}^{-2}.\\text{s}^{-1}$",\
"ilimite.txt" u ($1*1000):4 ls 5 title "$D_e=10^{-8}\\text{cm}^{-2}.\\text{s}^{-1}$",\
"ilimite.txt" u ($1*1000):5 ls 1 title "$D_e=10^{-10} \\text{cm}^{-2}.\\text{s}^{-1}$",\
