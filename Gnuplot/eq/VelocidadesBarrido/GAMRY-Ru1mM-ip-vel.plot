#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "GAMRY-Ru1mM-ip-vel.tikz"

#Leyenda
	set key top left Left reverse samplen -2 font ",10" textcolor rgb "gray40"

#Saco el Borde
	unset border

#Saco las marcas
 unset tics
 set logscale x
#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Circulos Negros
set style line 2 lc rgb 'red' pt 7 ps 1  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lc rgb 'red' lt -1 pt -1

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid front ls 11

#Coloca los nombre de los ejes
	set xlabel "v / mV.s$^{-1}$"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "(i$_{p}$/v)/(i$_{p}$/v)$_{\\text{v}\\rightarrow 0}$"	font ",14" textcolor rgb "gray40" offset -2,0

#EL valor 4.01 corresponde al pico maximo en la oxidación.
#
#plot "Barrido-Ru1mM-Max-Min.txt" using (log10($1)):(log10($3)) with points ls 1, f(x) with lines ls 2
plot "GAMRY-Ru1mM-Max-Min.txt" using 1:(($3/$1)/(-4.83/3)) with points ls 1 title "Pico \'anodico", \
"GAMRY-Ru1mM-Max-Min.txt" using 1:(($5/$1)/(-9.919/3)) with points ls 2 title "Pico cat\'odico"