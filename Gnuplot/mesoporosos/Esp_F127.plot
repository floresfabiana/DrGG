#Para ver en pantalla
#reset
#set terminal aqua
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "Esp_F127.tikz" 

#Saco la leyenda
unset key
#set key bottom left Left reverse samplen 3  font ",10" textcolor rgb "gray40"

#Saco el Borde
unset border

#Saco las marcas
unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'gray40' pt 7 ps 0.75 #Circulo
set style line 3 lc rgb '#ff4500' lt 1 lw 2 pt 7 ps 0.5 #Naranja

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 11
set xrange[0:5000]
set yrange[100:400]

#Coloca los nombre de los ejes
set xlabel "Velocidad de rotaci\'on / min$^{-1}$" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "Espesor / nm" font ",14" textcolor rgb "gray40" offset  -2,0

#Hace un FIT
f(x) = a*x**(b)
fit f(x) "Datos_esp_F127.txt" using 1:2 via a,b
stddev_y = sqrt(FIT_WSSR / (FIT_NDF + 1 ))

#R cuadrado sacado con el Origin: R2=9.7551

set label 1 sprintf("$t=%3.0fx^{%3.3f}$",a,b) at 3100,380 font ",10" textcolor rgb "gray40"
set label 3 "R$^2$=0,97551" at 3100,360 font ",10" textcolor rgb "gray40"

#Ploteo todas las funciones que les digamos
plot f(x) with lines ls 3, "Datos_esp_F127.txt" using 1:2:(2*(stddev_y/sqrt(4))) with yerrorbar ls 1