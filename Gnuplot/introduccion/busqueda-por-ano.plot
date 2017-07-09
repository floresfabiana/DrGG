#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz tikzarrows
set output "busqueda-por-ano.tikz" 
set key left Left reverse textcolor 'gray40'

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
	set xlabel "Año"  font ",14" textcolor rgb "gray40" offset 0,-1
    set ylabel "N\'umero de publicaciones" font ",14" textcolor rgb "gray40" offset -2,0
    set ytics offset -2,0,0 center format "%'gK"
    set xtics 5
    set xrange[1990:2016]
    set yrange[-1:]
#Cambio de aspecto
#set size square 2.2,1
#set size ratio 0.56
set style line 100 lc rgb '#0060ad' lt 1 lw 1.5 pt 7 pi -1 ps 0.6
set style line 101 lc rgb 'orange' lt 1 lw 1.5 pt 7 pi -1 ps 0.6
set style line 102 lc rgb 'gray30' lt 1 lw 1.5 pt 7 pi -1 ps 0.6
set pointintervalbox 1

plot  "Scopus-180742-Analyze-Year.csv" u 1:($2/1000) w linespoints ls 102 title "Nanociencia",\
"Scopus-127166-Analyze-Year.csv" u 1:($2/1000) w linespoints ls 101 title "Nanotecnologia",\

#"productos.txt" u 1:($2/1000) w linespoints ls 100 title "Productos"
