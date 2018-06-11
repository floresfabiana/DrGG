#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "IR_F127_vacio_AGUA.tikz" 

#Para plotear archivos CSV
set datafile separator ","

#Saco la leyenda
unset key

#Hago el inset
set multiplot 

#Pongo la leyenda
#set key top left Left reverse samplen 3 font ",10" textcolor rgb "gray20"

#Saco el Borde
unset border

#Saco las marcas
unset tics
 
#Defino estilos para cada tipo de linea
set style line 1 lc rgb '#800000' lt 1 lw 1.2 pt 7 ps 1 #Marron
set style line 3 lc rgb '#ff4500' lt 1 lw 1.2 pt 7 ps 1 #Naranja
set style line 5 lc rgb 'red' lt 1 lw 1.2 pt 7 ps 1 #Naranja

#Estilos de los ejes 
set style line 10 lc rgb 'gray20' lt 1 lw 5 
set border 3 back ls 10 lw 1.5 
set tics nomirror


#set arrow 1 arrowstyle 200 from first -100,1 to first -100,0 
#Rango invertido para el IR
set xrange [4000:500]

#Rango Y
set yrange [-0.075:]

#Saco los y
set format y ""

#Estilo de la grilla
set style line 11 lc rgb 'gray50' lt 0 lw 1 
set grid back ls 11

#Coloca los nombre de los ejes
set xlabel "N\'umero de onda / cm$^{-1}$" font ",14" textcolor rgb "gray20" offset  0,-2
set ylabel "Absorbancia / u. a." font ",14" textcolor rgb "gray20" offset  -2,0

#hago que sea mas largo en el eje X
set size ratio 0.6

#Leyenda de los Picos
#set label "$\\nu_{\\text{\\tiny{C-H}}}$" at 3000,0.05 font ",10" textcolor rgb "gray20"
set label "VacSF extraído + H$_2$O" at 4000,0.15 font ",8" textcolor rgb "black"
set label "VacSF extraído" at 4000,0.07 font ",8" textcolor rgb "black"
set label "VacSF s/extraer" at 4000,-0.0 font ",8" textcolor rgb "black"

#Ploteo todas las funciones que les digamos
plot "Si_130VF127.CSV" using ($1):($2) with lines ls 1 title "PDM@Si-F127 sin extraer",\
"Si_130VF127_extraido.CSV" using 1:($2+0.032)  with lines ls 5 title "PDM@Si-F127 extraido 2-propanol",\
"Si_F127_T130V_7d_Tratamiento_Agua_Acida.CSV" using 1:($2+0.09) with lines ls 3 title "PDM@Si-F127 extraido agua ácida",\


#Inset con la extracción
  set size 0.42,0.28
  set origin 0.1,0.68
  set object 1 rectangle from graph 0,0 to graph 1,1 behind fc rgb "white"
  set xrange [3100:2700]
  set tic scale 0.5
  set xtics (3100,2900,2700)
  set yrange [-0.031:-0.012]
  set border 15
  unset grid
  set xlabel ""

  unset ytics
  unset mytics 
  set xtics font ", 6"
  set ylabel ""
  unset label

   #Flechas
    set style line 100  lc rgbcolor 'gray20' lw 1.5
    set style arrow 200 head filled size screen 0.02,10 ls 100
    set arrow 1 arrowstyle 200 from graph 1.1,0.9 to graph 0.55,0.9
    set arrow 2 arrowstyle 200 from graph 1.1,0.5 to graph 0.55,0.5
    set arrow 3 arrowstyle 200 from graph 1.1,0.31 to graph 0.55,0.31
   #Leyenda
   set label "VacSF extraído + H$_2$O" at 2670,-0.025 font ",8" textcolor rgb "black"
   set label "VacSF extraído" at 2670,-0.021 font ",8" textcolor rgb "black"
   set label "VacSF s/extraer" at  2670,-0.014 font ",8" textcolor rgb "black"
   
  unset key
  plot "Si_130VF127.CSV" using 1:($2) with lines ls 1 title "PDM@Si-CTAB sin extraer",\
   "Si_130VF127_extraido.CSV" using 1:($2-0.035) with lines ls 5 title "PDM@Si-F127 extraido",\
   "Si_F127_T130V_7d_Tratamiento_Agua_Acida.CSV" using 1:($2-0.053) with lines ls 3 title "PDM@Si-F127 extraido agua ácida",\
  
  unset multiplot
