#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "IR_F127_simplificado.tikz" 

#Para plotear archivos CSV
set datafile separator ","

#Saco la leyenda
#unset key

#Hago el inset
set multiplot

#Pongo la leyenda
set key top left Left reverse samplen 3 font ",10" textcolor rgb "gray40"

#Saco el Borde
unset border

#Saco las marcas
unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb '#800000' lt 1 lw 1.2 pt 7 ps 1 #Marron
set style line 3 lc rgb '#ff4500' lt 1 lw 1.2 pt 7 ps 1 #Naranja

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror

#Rango invertido para el IR
set xrange [4000:500]

#Rango de Y
set yrange [-0.08:]

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

#Leyenda de los Picos
#set label "$\\nu_{\\text{\\tiny{C-H}}}$" at 3000,0.05 font ",10" textcolor rgb "gray40"

#Ploteo todas las funciones que les digamos
plot "Si_EtF127.CSV" using 1:2 with lines ls 1 title "PDM@Si-F127 sin extraer", "Si_EtF127_extraido.CSV" using 1:($2+0.07) with lines ls 3 title "PDM@Si-F127 extraido"

#Inset con la extracción
  set size 0.42,0.28
  set origin 0.15,0.55
  set object 1 rectangle from graph 0,0 to graph 1,1 behind fc rgb "white"
  set xrange [3100:2700]
  set tic scale 0.5
  set xtics (3100,2900,2700)
  set yrange [-0.1:-0.075]
  set border 15
  unset grid
  set xlabel ""
  unset ytics
  unset mytics 
  set xtics font ", 6"
  set ylabel ""
  unset label
  unset arrow
  unset key
  plot "Si_EtF127.CSV" using 1:($2-0.065) with lines ls 1 title "PDM@Si-CTAB sin extraer", "Si_EtF127_extraido.CSV" using 1:($2-0.082) with lines ls 3 title "PDM@Si-CTAB extraido"
  unset multiplot