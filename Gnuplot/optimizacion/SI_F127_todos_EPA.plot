#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "SI_F127_todos_EPA.tikz" 

#Saco la leyenda
set key top left Left reverse samplen 3 font ",10" textcolor rgb "gray40"
#Saco el Borde
unset border

#Saco las marcas
unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb '#800000' lt 1 lw 1 pt 7 ps 1 #Marron
set style line 2 lc rgb '#ff4500' lt 1 lw 1 pt 7 ps 1 #Naranja
set style line 3 lc rgb 'black' lt 1 lw 1 pt 7 ps 1 #Naranja
set style line 4 lc rgb 'red' lt 1 lw 1 pt 7 ps 1 #Naranja
set style line 5 lc rgb 'blue' lt 1 lw 1 pt 7 ps 1 #Naranja
set style line 6 lc rgb 'gray40' lt 1 lw 1 pt 7 ps 1 #Naranja

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 11 back ls 10 lw 1.5 
set tics nomirror


#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 11

#Coloca los nombre de los ejes
set xlabel "Humedad Relativa / \\%HR" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "\'Indice de refracci\'on" font ",14" textcolor rgb "gray40" offset  -2,0
#set y2label "\\% Volumen Poroso" font ",14" textcolor rgb "gray40" offset  2,0

#unset key
#Ploteo todas las funciones que les digamos
plot "Si_CF127-EPA.txt" using 1:2 with linespoints ls 1 title "Calcinado","Si_CF127-EPA.txt" using 5:6 with linespoints ls 1 notitle,"Si_EtF127-EPA.txt" using 1:2 with linespoints ls 2 title "Simplificado", "Si_EtF127-EPA.txt" using 5:6 with linespoints ls 2 notitle,"Si_130F127-EPA.txt" using 1:2 with linespoints ls 3 title "Prolongado", "Si_130F127-EPA.txt" using 5:6 with linespoints ls 3 notitle,"Si_BF127-EPA.txt" using 1:2 with linespoints ls 4 title "Basico", "Si_BF127-EPA.txt" using 5:6 with linespoints ls 4 notitle,"Si_AF127-EPA.txt" using 1:2 with linespoints ls 5 title "Acido", "Si_AF127-EPA.txt" using 5:6 with linespoints ls 5 notitle,"Si_130VF127-EPA.txt" using 1:($2-0.04) with linespoints ls 6 title "Vacio", "Si_130VF127-EPA.txt" using 5:($6-0.04) with linespoints ls 6 notitle
