#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "aptesru-10mM.tikz" 

#Saco la leyenda
set key top left Left reverse samplen 3 spacing 2.1 font ",14" textcolor rgb "black" 


#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

set style line 1 lc rgb 'gray80' lt 1 lw 0.5 #Marron
set style line 2 lc rgb 'black' lt 1 dashtype 2 lw 0.5
set style line 3 lc rgb 'black' lt 1 lw 0.5 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray70' lt 0 lw 1 
	set grid back ls 111
    set tics nomirror font ",14"

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ECS/mV}$" font ",18" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",18" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-600:100]
	set xtics offset 0,-0.5
	set ytics offset -0.3,0
	set yrange [-500:500]

#Para graficar todas
plot "APTES/Ru.txt" using 1:($2/0.0314) every 10 with lines ls 1 title "SZF",\
"APTES/Ru.txt" using 3:($4/0.0314) every 10 with lines ls 1 notitle,\


#"APTES/Ru.txt" using 7:($8/0.0314) every 7 with lines ls 3,\
#"APTES/Ru.txt" using 9:($10/0.0314) every 7 with lines ls 3,\
