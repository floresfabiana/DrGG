#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "comparacionszfszfn.tikz" 


#Saco la leyenda
set key top left Left reverse samplen 2 spacing 2.3 font ",14" textcolor rgb "black"  at -220,-43 width -10


#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

set style line 1 lc rgb 'gray50' lt 1 lw 0.75 #Marron
set style line 2 lc rgb 'black' lt 1 dashtype 2 lw 0.75
set style line 3 lc rgb 'black' lt 1 lw 0.75 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror font ",14"

#Estilo de la grilla
	set style line 111 lc rgb 'gray70' lt 0 lw 1 
	set grid back ls 111


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ECS/mV}$" font ",18" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",18" textcolor rgb "gray20" offset -2.7,0

#Fuerza a establecer un rango
	 
	#set xrange [-600:100]
	set xtics offset 0,-0.5
	set ytics offset -0.3,0

	#set yrange [-10:40]

#Para graficar todas	


set arrow 10 from -175,2 to -230,37 head filled size screen 0.02,10 lw 2 lc 'red' front
set arrow 11 from -262,2 to -270,37  head filled size screen 0.02,10 lw 2 lc 'red' front
set arrow 12 from -320,-10 to -325,-45 head filled size screen 0.02,10 lw 2 lc 'red' front
set arrow 13 from -270,-10 to -320,-65  head filled size screen 0.02,10 lw 2 lc 'red' front

# plot for [i=1:15:2] 'Ru0315mM.txt' using i:(column(i+1)/0.0314) every 2 w lines ls 1, \
# 'Ru0315mM.txt' using 5:($6/0.0314) w lines ls 3, \
# 'Ru0315mM.txt' using 13:($14/0.0314) w lines ls 2

#plot "APTES/Ru.txt" u 11:($12/0.0314) w l ls 1 title "SZF 10 ciclos",\
#"APTES/Ru.txt" u 1:($2/0.0314) every 2 ::1::22400 w l ls 3 "SZF$^N_1$ 45 ciclos",\

plot "APTES/Ru.txt" u 11:($12/0.0314) every 5 w l ls 1 title "SZF$^N_1$ 45 ciclos",\
"APTES/Ru.txt" u 1:($2/0.0314) every 2 ::1::19600 w l ls 2 title "SZF \\hspace*{1.8mm} 14 ciclos"
