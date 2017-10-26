#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "CTAB_M2_Modelo_isoterma.tikz" 

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
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 11

#Rangos
set xrange [0:1]
set yrange [1.27:1.44]

#Flecha
set style line 100  lc rgbcolor 'gray40' lw 1.5
set style arrow 200 head filled size screen 0.02,10 ls 100

#Leyendas
#set label "a" at 0.016,1.423 font ",28" textcolor rgb 'black'
set label "adsorción" at 0.48,1.35 rotate by 76 font ",14" textcolor rgb 'gray40'
set label "desorción" at 0.34,1.353 rotate by 76 font ",14" textcolor rgb 'gray40'

#Coloca los nombre de los ejes
set xlabel "$\\text{P/P}_s$" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "\'Indice de refracci\'on" font ",14" textcolor rgb "gray40" offset  -2,0


#Ploteo todas las funciones que les digamos
plot "CTAB_M2_Modelo_isoterma.txt" using 1:2 with linespoints ls 3 notitle,\
"CTAB_M2_Modelo_isoterma.txt" using 1:2  with points ls 300 notitle,\
"CTAB_M2_Modelo_isoterma.txt" using 4:5 axes x1y1 with linespoints ls 1 notitle,\
"CTAB_M2_Modelo_flecha1.txt" u 1:2 smooth bezier ls 100,\
"CTAB_M2_Modelo_flecha1.txt" u 3:4:5:6 w vectors arrowstyle 200,\
"CTAB_M2_Modelo_flecha2.txt" u 1:2 smooth bezier ls 100,\
"CTAB_M2_Modelo_flecha2.txt" u 3:4:5:6 w vectors arrowstyle 200,\

#"CTAB_M2_Modelo_flecha1.txt" u 1:2 with points ls 100,\