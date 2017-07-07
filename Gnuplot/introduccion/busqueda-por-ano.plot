#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz tikzarrows
set output "busqueda-por-ano.tikz" 

#Para archivos csv
set datafile separator ","

#Saco el Borde
	unset border

#Saco las marcas
 # 	unset tics
 	set mxtics
#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 15 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray40' lt 0 lw 1 
	set grid noxtics front ls 11
    set grid ytics back ls 11
#Coloca los nombre de los ejes
	set xlabel "Año"  font ",14" textcolor rgb "gray40" offset 0,-2
    set ytics offset -2,0,0 center format "%'gK"
    set xtics 5
    set xrange[1990:2016]

#Cambio de aspecto
#set size square 2.2,1
#set size ratio 0.56


plot "Scopus-127166-Analyze-Year.csv" u 1:($2/1000) w linespoints title "Nanotecnologia", "Scopus-180742-Analyze-Year.csv" u 1:($2/1000) w linespoints title "Nanociencia"
