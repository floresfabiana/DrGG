#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "IR_CTAB_simplificado.tikz" 

#Para plotear archivos CSV
set datafile separator ","

#Saco la leyenda
#unset key

#Para hacer los inset
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

#Saco los y
set format y ""

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 11

#Coloca los nombre de los ejes
set xlabel "N\'umero de onda / cm$^{-1}$" font ",14" textcolor rgb "gray40" offset  0,-2
set ylabel "Absorbancia / u. a." font ",14" textcolor rgb "gray40" offset  -2,0

#hago que sea mas largo en el eje X
set size ratio 0.6

#Leyenda de los Picos
#set label "$\\nu_{\\text{\\tiny{C-H}}}$" at 3000,0.05 font ",10" textcolor rgb "gray40"

#Ploteo todas las funciones que les digamos
plot "Si_EtCTAB.CSV" using ($1):($2-0.1) with lines ls 1 title "PDM@Si-CTAB sin extraer", "Si_EtCTAB_extraido.CSV" using 1:($2+0.1) with lines ls 3 title "PDM@Si-CTAB extraido"


#Inset con la extracción
  set size 0.42,0.28
  set origin 0.15,0.59
  set object 1 rectangle from graph 0,0 to graph 1,1 behind fc rgb "white"
  #set object 1 rectangle from screen 0.2,0.6 to screen 0.5,0.9 fillcolor rgb "green"
  #set title 'detalle de la zona recuadrada' font ",8" textcolor rgb "gray40"
  set xrange [3000:2800]
  set tic scale 0.5
  set xtics 100
  set yrange [-0.025:0.025]
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
  plot "Si_EtCTAB.CSV" using 1:2 with lines ls 1 title "PDM@Si-CTAB sin extraer", "Si_EtCTAB_extraido.CSV" using 1:($2+0.01) with lines ls 3 title "PDM@Si-CTAB extraido"
  unset multiplot