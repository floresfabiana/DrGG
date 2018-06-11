#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz tikzarrows
set output "histogramas-ciencia.tikz" 

#Leyenda
set key at graph 0.95, 0.78 horizontal samplen 0.3 spacing 6
#set label 2 'Nanociencia' at graph 0.85, 0.78 left rotate by 90  font ",14"   textcolor rgb "gray20"
set label 3 'Nanotecnología' at graph 0.93, 0.76 left rotate by 90  font ",14"  textcolor rgb "gray20"
set object 2 rect from 8.5,28 to 9.5,36 fc rgb "white" fs noborder

#Saco el Borde
	unset border

#Saco las marcas
 # 	unset tics
 	unset mxtics
 	set xtics scale 0
#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 15 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray50' lt 0 lw 1 
	#unset grid
	set grid noxtics front ls 11
    set grid ytics back ls 11
#Coloca los nombre de los ejes
	set y2label "N\'umero de publicaciones"  font ",18" textcolor rgb "gray20" offset 2,0

#Cambio de aspecto
set size square 1,2.2
set size ratio 1.8

#Leyenda

#Aspecto barras
set style fill solid 0.6 border

#Archivos CSV
set datafile separator ","

#Histograma
set style data histograms

#separacion
set style histogram gap 1

#Nombre de los paises rotados
set xtics rotate by 90 font ",14" offset 0, 0.6, 0 right
set y2tics rotate by 90 font ",14" offset 1,0,0 center format "%'gK"
set format y ""
set boxwidth 0.95 relative

#set label 100 at 8.8,0.6 "567" font ",8" rotate by 90
#set label 200 at 9.17,0.2 "294" font ",8" rotate by 90

#Grafico
plot 'Scopus-Nanotech-Paises.csv' using ($2/1000):xtic(1) every ::1::10 lc 'gray20' title " "