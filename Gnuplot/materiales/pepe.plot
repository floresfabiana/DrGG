#Para ver en pantalla
reset
set terminal x11

#Para exportar como latex
#set terminal tikz
#set output "onda-triangular.tikz" 

#Saco la leyenda
unset key

#Saco el Borde
unset border

#Saco las marcas
unset tics

#Para colocar flechas de tal posicion a tal otra
#set arrow from 0,0 to 0,62
#set arrow from 0,0 to 85,0

#Defino estilos para cada tipo de linea
# set style line 1 lc rgb 'gray40' pt 7 ps 1 lw 1#Cuadrado
# set style line 2 lc rgb 'gray40' pt 7 ps 1  #Circulo
# set style line 3 lc rgb 'black' pt 7 ps 9 #Triangulo 
# set style line 4 lc rgb 'red' lt -1 pt -1
set style line 1 lc rgb '#800000' lt 1 lw 2 #Marron
set style line 2 lc rgb '#ff0000' lt 1 lw 2 #ROjo
set style line 3 lc rgb '#ff4500' lt 1 lw 2 #Naranja
set style line 4 lc rgb '#ffa500' lt 1 lw 2 #Amarillo
set style line 5 lc rgb '#006400' lt 1 lw 2 #Verde
set style line 6 lc rgb '#0000ff' lt 1 lw 2 #Azxul
set style line 7 lc rgb 'white' lt 1 lw 2 #Violeta

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 

#set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
set ytics 10 
set mytics 2 

#Pone el Titulo
#set title "Grafico 1"

#Fuerza a establecer un rango
set xrange [0:2]
set yrange [-1:1]

#Graduacion del eje x e Intervalos entre las marcas mayores
set xtics 1
set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
set ytics 10
set mytics 2

#Hace un FIT
#f(x) = a*x + b
#fit f(x) "FIB_Au.txt" using 1:2 via a,b

#stat "FIB_Au.txt" using 1:2 

#set label 1 sprintf("y=%3.3f+%3.3f",a,b) at 2,57 font ",10" textcolor rgb "gray40"
#set label 3 sprintf("R=%3.4f",STATS_correlation) at 2,53 font ",10" textcolor rgb "gray40"


#Ploteo todas las funciones que les digamos

#Coloca los nombre de los ejes
set xlabel "tiempo" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "potencial" font ",14" textcolor rgb "gray40" offset  -2,0

#set style fill transparent solid 0.5 noborder
plot "onda-triangular.txt" using 1:2 with lines ls 6
#plot "data.txt" using 1:2 smooth bezier with filledcurves y2 ls 6,"data.txt" using 3:4 smooth bezier with filledcurves y2 ls 7

#plot  with filledcurves closed
