
#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "ciclosintfecn.tikz" 

#Saco la leyenda
	set key center right Left sample -1 spacing 3 reverse font ",16" textcolor rgb "black" 

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

set style line 1 lc rgb 'gray60' pt 9 lt 1 ps 1.2 lw 0.5 #Marron
set style line 2 lc rgb 'red' pt 7 lt 1 ps 1 lw 2.5 #ROjo
set style line 3 lc rgb 'blue' pt 1 lt 1 ps 1.2 lw 1 #Azul
set style line 5 lc rgb 'black' pt 13 lt 1 ps 1.2 lw 1 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray70' lt 0 lw 1 
	set grid back ls 111


#Graduacion del eje y e Intervalos entre las marcas mayores
	set xtics 15
	set ytics 0.2
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "N\'umero de ciclos" font ",16" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}_p / \\text{j}^{\\text{Au}}_p$"	   font ",16" textcolor rgb "gray40" offset -2,0


#densidad de corriente en Au
#f(x)=340
f(x)=1 
#f(x)=10

plot [0:90] f(x) w p ls 2 title "Au",\
"FeCN-APTES-1mM-Ciclos.txt" u 1:(($5/0.0314+57)/340) ls 3 title "SZF$^N_1$",\
"FeCN-DHDP-3mM-Ciclos.txt" u 1:(($5/0.0314+57)/340) ls 5 title "SZF$^P_3$",\
"FeCN-SinFuncionalizar-Ciclos.txt" u 1:(($5/0.0314)/340) ls 1 title "SZF",\
