#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "Espesor_Au.tikz" 

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
set style line 1 lc rgb 'gray20' pt 7 ps 1 lw 1#Cuadrado
set style line 2 lc rgb 'gray20' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'black' pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray20' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray50' lt 0 lw 1 
set grid back ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
set ytics 10 
#set mytics 2 

#Pone el Titulo
#set title "Grafico 1"

#Coloca los nombre de los ejes
set xlabel "Tiempo/s" font ",14" textcolor rgb "gray20" offset  0,-2
set ylabel "Espesor/nm" font ",14" textcolor rgb "gray20" offset  -2,0

#Fuerza a establecer un rango
set xrange [0:70]
set yrange [0:60]

#Graduacion del eje x e Intervalos entre las marcas mayores
set xtics 10
#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
set ytics 10
set mytics 2

#Hace un FIT
f(x) = a*x + b
fit f(x) "Espesor_Au.txt" using 1:2 via a,b

stat "Espesor_Au.txt" using 1:2

set label 1 sprintf("y=%3.3f x +%3.3f",a,b) at 2,57 font ",12" textcolor rgb "black"
set label 3 sprintf("R=%3.4f",STATS_correlation) at 2,52 font ",12" textcolor rgb "black"
 
 

#Ploteo todas las funciones que les digamos
plot "Espesor_Au.txt" using 1:2 with points ls 1, f(x) with line ls 4
