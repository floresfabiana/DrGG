#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz tikzarrows
set output "patentes.tikz" 
set key left Left reverse  samplen 3 textcolor 'gray40' font ",12"
set object 2 rect from 2002,7.5 to 2005.5,8.9 fc rgb "white" fs noborder

#Relacion de aspecto
set size ratio 0.60

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
	#unset grid
	set grid noxtics front ls 11
    set grid ytics back ls 11
#Coloca los nombre de los ejes
	unset xlabel
	set xlabel "Año"  font ",14" textcolor rgb "gray40" offset 0,-1
    set ylabel "N\'umero de patentes" font ",14" textcolor rgb "gray40" offset -2,0
    set ytics offset -2,0,0 center format "%'gK"
    set xtics 5 
    set xtics add (2001,2005,2010)
    set mxtics 5
    set xrange[2001:2016]
    set yrange[0:]
#Cambio de aspecto
#set size square 2.2,1
#set size ratio 0.56
set style line 100 lc rgb '#0060ad' lt 1 lw 1.5 pt 5 pi -1 ps 0.6
set style line 101 lc rgb 'orange' lt 1 lw 1.5 pt 3 pi -1 ps 0.6
set style line 102 lc rgb 'gray30' lt 1 lw 1.5 pt 7 pi -1 ps 0.6
set style line 103 lc rgb 'brown' lt 1 lw 1.5 pt 4 pi -1 ps 0.6
set style line 104 lc rgb 'blue' lt 1 lw 1.5 pt 6 pi -1 ps 0.6
set pointintervalbox 1

plot "patentesUSPTO.txt" u 1:($2/1000) w linespoints ls 102 title "USPTO",\
"patentesEPO.txt" u 1:($2/1000) w linespoints ls 100 title "EPO",\


#"productos.txt" u 1:($2/1000) w linespoints ls 100 title "Productos"
