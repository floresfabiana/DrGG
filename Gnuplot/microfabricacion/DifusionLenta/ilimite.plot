#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "ilimite.tikz" 

#Saco la leyenda
	set key top right Left sample  3 spacing 2 reverse font ",10" textcolor rgb "black" 

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

set style line 1 lc rgb 'gray60' pt 9 lt 1 ps 1.2 lw 2 #Marron
set style line 2 lc rgb 'red' pt 7 lt 1 ps 0.80 lw 2 #ROjo
set style line 3 lc rgb 'blue' pt 5 lt 1 ps 0.80 lw 2 #Azul
set style line 5 lc rgb 'black' pt 13 lt 1 ps 1.2 lw 2 #Azul
set style line 6 lc rgb 'black' lt 1 dashtype 2 lw 2.5

#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray50' lt 0 lw 1 
	set grid back ls 111


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set xtics 15
	#set mytics 2 
	set yrange[-10:10]
	set ytics 5

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\Delta E^{\\circ}$ /mV" font ",14" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{log}(i_{lim}/i_s)$"	   font ",14" textcolor rgb "gray20" offset -2,0
	set label "$i_{lim}=i_{s}$" at 420,0.75 font ",12" textcolor rgb "black"

f(x)=0

plot "ilimite.txt" u ($1*1000):2 w l ls 2 title "$D_e=10^{-4}\\text{cm}^{-2}.\\text{s}^{-1}$",\
"ilimite.txt" u ($1*1000):3 w l ls 3 title "$D_e=10^{-6}\\text{cm}^{-2}.\\text{s}^{-1}$",\
"ilimite.txt" u ($1*1000):4 w l ls 5 title "$D_e=10^{-8}\\text{cm}^{-2}.\\text{s}^{-1}$",\
"ilimite.txt" u ($1*1000):5 w l ls 1 title "$D_e=10^{-10} \\text{cm}^{-2}.\\text{s}^{-1}$",\
[-10:600] f(x)  ls 6 notitle
