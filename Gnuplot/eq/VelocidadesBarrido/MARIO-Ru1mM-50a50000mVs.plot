#Para ver en pantalla
#reset
#set terminal x11

#Para exportar como latex
set terminal tikz
set output "MARIO-Ru1mM-50a50000mVs.tikz"

#Archivo separado por comas
set datafile sep','

#Saco la leyenda
unset key

#Saco el Borde
unset border

#Saco las marcas
unset tics

#Lo saque de http://www.perbang.dk/rgbgradient/
set style line 1000  lc rgb 'black' lt 1 lw 3 # --- Verde
set style line 1  lc rgb '#88f051' lt 1 lw 1 # --- Verde
set style line 3  lc rgb '#82eb55' lt 1 lw 1 #      .
set style line 5  lc rgb '#7ce75a' lt 1 lw 1 #      .
set style line 7  lc rgb '#77e35e' lt 1 lw 1 #      .
set style line 9  lc rgb '#71de63' lt 1 lw 1 #      .
set style line 11  lc rgb '#6bda67' lt 1 lw 1 #      .
set style line 13  lc rgb '#66d66c' lt 1 lw 1 #      .
set style line 15  lc rgb '#60d171' lt 1 lw 1 #      .
set style line 17 lc rgb '#5acd75' lt 1 lw 1 #      .
set style line 19 lc rgb '#55c97a' lt 1 lw 1 #      .
set style line 21 lc rgb '#4fc47e' lt 1 lw 1 #      .
set style line 23  lc rgb '#49c083' lt 1 lw 1 #      .
set style line 25  lc rgb '#44bc88' lt 1 lw 1 #      .
set style line 27  lc rgb '#3eb78c' lt 1 lw 1 #      .
set style line 29  lc rgb '#38b391' lt 1 lw 1 #      .
set style line 31  lc rgb '#33af95' lt 1 lw 1 #      .
set style line 33  lc rgb '#2daa9a' lt 1 lw 1 #      .
set style line 35  lc rgb '#27a69e' lt 1 lw 1 #      .
set style line 37 lc rgb '#22a2a3' lt 1 lw 1 #      .
set style line 39 lc rgb '#1c9da8' lt 1 lw 1 #
set style line 41 lc rgb '#1699ac' lt 1 lw 1 #      .
set style line 43 lc rgb '#1195b1' lt 1 lw 1 #      .
set style line 45 lc rgb '#0b90b5' lt 1 lw 1 # --- Azul
set style line 47 lc rgb '#058cba' lt 1 lw 1 # --- Azul
set style line 49 lc rgb '#0088bf' lt 1 lw 1 # --- Azul



#Estilos de los ejes 
set style line 300 lc rgb 'gray20' lt 1 lw 5 
set border 3 back ls 300 lw 1.5 
set tics nomirror

#Estilo de la grilla
set style line 400 lc rgb 'gray20' lt 0 lw 1 
set grid back ls 400


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray20" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [-700:300]
	#set yrange [-7000:15000]

#plot  using 1:($2/0.0314) w lines ls 5, \


#Para graficar todas
plot "MARIO-Ru1mM-50a50000mVs.csv" u ($3*1000):($4*1e6/0.0314/39) every ::5::9700 smooth bezier  ls 1, \
"MARIO-Ru1mM-50a50000mVs.csv" u ($5*1000):($6*1e6/0.0314) every ::5::9400 smooth bezier ls 3,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($7*1000):($8*1e6/0.0314) every ::5::9300 smooth bezier ls 5,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($9*1000):($10*1e6/0.0314/108) every ::5::9200 smooth bezier ls 7,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($11*1000):($12*1e6/0.0314) every ::5::2900 with lines ls 7,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($13*1000):($14*1e6/0.0314)  every ::5::2950 with lines ls 9,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($15*1000):($16*1e6/0.0314)  every ::5::2950 with lines ls 11,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($17*1000):($18*1e6/0.0314)  every ::5::3450 with lines ls 11,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($19*1000):($20*1e6/0.0314)  every ::5::3400 with lines ls 13,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($21*1000):($22*1e6/0.0314)  every ::5::3300 with lines ls 13,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($23*1000):($24*1e6/0.0314)  every 5::5::3400 with lines ls 15,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($25*1000):($26*1e6/0.0314)  every 5::5::4200 with lines ls 15,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($27*1000):($28*1e6/0.0314)  every 5::5::4000 with lines ls 17,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($29*1000):($30*1e6/0.0314)  every 5::5::4900 with lines ls 17,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($31*1000):($32*1e6/0.0314)  every 5::5::4400 with lines ls 19,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($33*1000):($34*1e6/0.0314)  every 5::5::4400 with lines ls 21,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($35*1000):($36*1e6/0.0314)  every 5::5::4700 with lines ls 23,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($37*1000):($38*1e6/0.0314)  every 5::5::4700 with lines ls 25,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($39*1000):($40*1e6/0.0314)  every 5::5::5000 with lines ls 27,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($41*1000):($42*1e6/0.0314)  every 5::5::5100 with lines ls 29,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($43*1000):($44*1e6/0.0314)  every 5::5::5100 with lines ls 31,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($45*1000):($46*1e6/0.0314)  every 5::5::5400 with lines ls 33,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($47*1000):($48*1e6/0.0314)  every 5::5::7000 with lines ls 35,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($49*1000):($50*1e6/0.0314)   every 5::5::6800 with lines ls 37,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($51*1000):($52*1e6/0.0314)   every 5::5::8400 with lines ls 41,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($53*1000):($54*1e6/0.0314)   every 5::5::9400 with lines ls 43,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($55*1000):($56*1e6/0.0314)   every 5::5::10000 with lines ls 45,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($57*1000):($58*1e6/0.0314)   every 5::5::10720 with lines ls 47,\
"MARIO-Ru1mM-50a50000mVs.csv" u ($59*1000):($60*1e6/0.0314)   every 5::5::10900 with lines ls 49,\



# "MARIO-Ru1mM-50a50000mVs.csv" u 51:($52*1e6/0.0314)  every ::5::5400 with lines ls 1000,\
# "MARIO-Ru1mM-50a50000mVs.csv" u 53:($54*1e6/0.0314)  every ::5::5400 with lines ls 1000,\
# "MARIO-Ru1mM-50a50000mVs.csv" u 55:($56*1e6/0.0314)  every ::5::6400 with lines ls 1000,\
# "MARIO-Ru1mM-50a50000mVs.csv" u 57:($58*1e6/0.0314)  every ::5::6400 with lines ls 1000,\


#"MARIO-Ru1mM-50a50000mVs.csv" u 11:($12*1000/0.0314) every ::5::9700 w lines ls 9,\
#"MARIO-Ru1mM-50a50000mVs.csv" u 13:($14*1000/0.0314) every ::5::9700 w lines ls 11,\

#plot for [i=3:59:2] "MARIO-Ru1mM-50a50000mVs.csv" using (column(i)*1000):(column(i+1)*1e6/0.0314) w lines ls i
#plot for [i=1:1:2] "Ru10mM-Barrido-3a1000mVs.csv" u i:(column(i+1/0.0314)) w lines   | bezier | sbezier}
 