#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "CTAB_M2_Modelo_distribucion.tikz" 

#Saco la leyenda
unset key

#Saco las marcas
unset mxtics

#Fuerza a establecer un rango
unset xtics
unset ytics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' lt 1 lw 1.5 pt 7 ps 1 #Naranja
set style line 3 lc rgb 'black' lt 1 lw 1.5 pt 6 ps 1 #Naranja
set style line 300 lc rgb 'white' lt 1 lw 1.5 pt 7 ps 0.5 #Naranja

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 15	 back ls 10 lw 1.5 
	#set border 2	 back ls 10 lw 1.5 


#Estilo de la grilla
set style line 11 lc rgb 'red' lt 0 lw 1 
set grid back ls 11

#Rangos
set xrange [0:6]
set yrange [0:3.6]

#Leyenda
set label "cuellos" at 0.9,2.75  font ",16" textcolor rgb "black"
set label "poros" at 2.9,2.75  font ",16" textcolor rgb "black"
#set label "b" at 0.1,3.2  font ",24" textcolor rgb "black"

#Coloca los nombre de los ejes
set xlabel "Di\'ametro" font ",18" textcolor rgb "gray40" offset  0,-2
set ylabel "Poblaci\'on relativa" font ",18" textcolor rgb "gray40" offset  -2,0

#Ploteo todas las funciones que les digamos
plot "CTAB_M2_Modelo_distribucion.txt" using ($1*2-0.2):($2+0.1) with linespoints ls 3 notitle,\
"CTAB_M2_Modelo_distribucion.txt" using ($1*2-0.2):($2+0.1) with points ls 300 notitle,\
"CTAB_M2_Modelo_distribucion.txt" using ($3*2-0.2):($4+0.1) with linespoints ls 1 notitle,\