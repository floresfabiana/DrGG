#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz tikzarrows
set output "productos2.tikz" 

#Leyenda
set key at graph 0.95, 0.80 horizontal samplen 0.3 spacing 6 width -0.5
#set label 2 'Nanociencia' at graph 0.85, 0.78 left rotate by 90  font ",14"   textcolor rgb "gray40"
set label 3 'Paises' at graph 0.93,0.78 left rotate by 90  font ",14"  textcolor rgb "gray40"
set label 4 'Compañías' at graph 0.86,0.78 left rotate by 90  font ",14"  textcolor rgb "gray40"
set label 5 'Productos' at graph 0.79,0.78 left rotate by 90  font ",14"  textcolor rgb "gray40"

#Saco el Borde
	unset border

#Saco las marcas
 # 	unset tics
 	unset mxtics
#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 15 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray40' lt 0 lw 1 
	unset grid
	#set grid noxtics front ls 11
    #set grid ytics back ls 11
#Coloca los nombre de los ejes
	set y2label "N\'umero de publicaciones"  font ",14" textcolor rgb "gray40" offset 2,0

#Cambio de aspecto
set size square 1,2.2
set size ratio 1.8
set yrange [0:8]
#Leyenda

#Aspecto barras
set style fill solid 0.6 border

#Archivos CSV
set datafile separator ","

#Histograma
set style data histograms

#separacion
set style histogram cluster gap 2

set xrange [-0.4:2.6]
#Nombre de los paises rotados
set xtics rotate by 90 font ",12" offset 0, 0.6, 0 right
set y2tics rotate by 90 font ",12" offset 1,0,0 center format "%'gK"
set format y ""
set boxwidth 0.95 relative

set label 101 at -0.1,6.9 "6879" font ",8"  textcolor rgb "gray40" rotate by 90
set label 102 at 0.1,1.3 "1322" font ",8" textcolor rgb "gray40"  rotate by 90
set label 103 at 0.3,0.05 "52" font ",8"  textcolor rgb "gray40" rotate by 90

set label 201 at 0.9,3 "3005" font ",8"  textcolor rgb "gray40" rotate by 90
set label 202 at 1.1,0.75 "750" font ",8" textcolor rgb "gray40"  rotate by 90
set label 203 at 1.3,0.03 "35" font ",8"  textcolor rgb "gray40" rotate by 90

set label 301 at 1.9,1.8 "1814" font ",8"  textcolor rgb "gray40" rotate by 90
set label 302 at 2.1,0.6 "622" font ",8" textcolor rgb "gray40"  rotate by 90
set label 303 at 2.3,0.03 "32" font ",8"  textcolor rgb "gray40" rotate by 90

#Grafico
plot 'productos.txt' using ($2/1000):xtic(1) lc 'gray20' title " ",\
'companias.txt' using ($2/1000):xtic(1) lc 'orange' title " ",\
'paises.txt' using ($2/1000):xtic(1) lc rgb '#0060ad' title " ",\