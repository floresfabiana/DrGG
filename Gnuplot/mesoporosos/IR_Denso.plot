#Para ver en pantalla
#reset
#set terminal aqua


#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "IR_Denso.tikz" 

#Para plotear archivos CSV
set datafile separator ","

#Saco la leyenda
#unset key

#Para hacer los inset
set multiplot

#Pongo la leyenda
unset key
#set key top Left right reverse samplen 3 font ",10" textcolor rgb "gray40"

#Saco el Borde
unset border

#Defino estilos para cada tipo de linea
set style line 1 lc rgb '#800000' lt 1 lw 1.2 pt 7 ps 1 #Marron
set style line 3 lc rgb '#ff4500' lt 1 lw 1.2 pt 7 ps 1 #Naranja
set style line 20 lc rgb 'gray10' lw 1 #Gris muy oscuro
set style line 10 lc rgb 'gray40' lt 1 lw 5 

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set xtics nomirror
set ytics nomirror
set mxtics 4

#Rango invertido para el IR
set xrange [4000:500]
set yrange [-0.1:0.6]
#Saco los y
set format y ""

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 11

#Coloca los nombre de los ejes
set xlabel "N\'umero de ondas / cm$^{-1}$" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "Absorbancia / u. a." font ",14" textcolor rgb "gray40" offset  -2,0

#hago que sea mas largo en el eje X
set size ratio 0.6

#set obj 9 rect from 3020,-0.07 to 2788,0.21

#Etiquetas de los pico

set style arrow 3 head filled size screen 0.015,10,65 ls 20

set label "\\tiny{TO}$_2$" at 900,0.20 font ",8" textcolor rgb "gray40"
set label "\\tiny{TO}$_2$" at 900,0.03 font ",8" textcolor rgb "gray40"
set label "$\\nu_{\\text{\\tiny{Si-OH}}}$" at 1010,0.08 font ",10" textcolor rgb "gray40"
set label "\\tiny{TO}$_3$" at 1180,0.48 font ",8" textcolor rgb "gray40"
set label "\\tiny{CO}$_2$" at 2450,0.17 font ",8" textcolor rgb "gray40"
set label "\\tiny{CO}$_2$" at 2450,0.02 font ",8" textcolor rgb "gray40"
set label "\\tiny{H$_2$O}" at 1700,0.05 font ",8" textcolor rgb "gray40"
set label "SiO$_2$ denso" at 3800,0.17 font ",8" textcolor rgb "black"
set label "PDM calcinada" at 3800,0.025 font ",8" textcolor rgb "black"

set arrow from 950,0.055 to 950,0.011 as 3

#set arrow from 800,-0.06 to 800,0.28 as 3
#set arrow from 955,-0.06 to 955,0.31 as 3
#set arrow from 2923,-0.06 to 2923,0.26 as 3
#set arrow from 1067,-0.06 to 1067,0.40 as 3

set object 2 rect from 1350,0.162 to 980,0.24 lw 1 fs empty border lt -1

#Ploteo todas las funciones que les digamos
plot "IR_Si_CF127.csv" using 1:($2-0.001) with lines ls 1 title "PDM@Si calcinada", "SiO2-denso.csv" using 1:($2/1.7-0.11) with lines ls 3 title "SiO$_2$ pulverizado"

# Now we set the options for the smaller plot
  set size 0.6,0.4
  set origin 0,0.55
  set object 1 rectangle from graph 0,0 to graph 1,1 behind fc rgb "white"
  #set object 1 rectangle from screen 0.2,0.6 to screen 0.5,0.9 fillcolor rgb "green"
  set title 'detalle de la zona recuadrada' font ",8" textcolor rgb "gray40"
  set xrange [1300:1000]
  set xtics 100
  set yrange [0.49:0.56]
  set border 15
  unset grid
  set xlabel ""
  set xtics font ", 6"
  set ylabel ""
  unset ytics
  unset label
  unset arrow
  unset key
  set label "\\tiny{LO}$_3$" at 1280,0.55 font ",8" textcolor rgb "gray40"
  set label "\\tiny{LO}$_4$" at 1210,0.525 font ",8" textcolor rgb "gray40"


# And finally let's plot the same set of data, but in the smaller plot
#Ploteo todas las funciones que les digamos
plot "SiO2-denso.csv" using 1:2 with lines ls 3 
#set label "LO$_4$" at 2500,0.3 font ",8" textcolor rgb "gray40"
#set label "LO$_3$" at 1300,0.19 font ",8" textcolor rgb "gray40"

unset multiplot