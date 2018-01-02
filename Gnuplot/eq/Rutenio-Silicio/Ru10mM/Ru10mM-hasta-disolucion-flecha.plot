#Para ver en pantalla
#reset
#set terminal x11
#set terminal aqua

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "Ru10mM-hasta-disolucion-flecha.tikz"

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Para colocar flechas de tal posicion a tal otra
  	#set arrow from 0,0 to 0,62
  	#set arrow from 0,0 to 85,0

red_000 = "#670106"
red_025 = "#8d0000"
red_050 = "#bf0000"
red_075 = "#e30101"
red_100 = "#ff0000"

#Flecha
set style line 100  lc rgbcolor 'gray40' lw 1.5
set style arrow 200 head filled size screen 0.03,15 ls 100

#Lo saque de http://www.perbang.dk/rgbgradient/
# set style line 1  lc rgb '#88f051' lt 1 lw 3 # --- Verde
# set style line 3  lc rgb '#82eb55' lt 1 lw 1 #      .
# set style line 5  lc rgb '#7ce75a' lt 1 lw 1 #      .
# set style line 7  lc rgb '#77e35e' lt 1 lw 1 #      .
# set style line 9  lc rgb '#71de63' lt 1 lw 1 #      .
# set style line 11  lc rgb '#6bda67' lt 1 lw 1 #      .
# set style line 13  lc rgb '#66d66c' lt 1 lw 1 #      .
# set style line 15  lc rgb '#60d171' lt 1 lw 1 #      .
# set style line 17 lc rgb '#5acd75' lt 1 lw 1 #      .
# set style line 19 lc rgb '#55c97a' lt 1 lw 1 #      .
# set style line 21 lc rgb '#4fc47e' lt 1 lw 1 #      .
# set style line 23  lc rgb '#49c083' lt 1 lw 1 #      .
# set style line 25  lc rgb '#44bc88' lt 1 lw 1 #      .
# set style line 27  lc rgb '#3eb78c' lt 1 lw 1 #      .
# set style line 29  lc rgb '#38b391' lt 1 lw 1 #      .
# set style line 31  lc rgb '#33af95' lt 1 lw 1 #      .
# set style line 33  lc rgb '#2daa9a' lt 1 lw 1 #      .
# set style line 35  lc rgb '#27a69e' lt 1 lw 1 #      .
# set style line 37 lc rgb '#22a2a3' lt 1 lw 1 #      .
# set style line 39 lc rgb '#1c9da8' lt 1 lw 1 #
# set style line 41 lc rgb '#1699ac' lt 1 lw 1 #      .
# set style line 43 lc rgb '#1195b1' lt 1 lw 1 #      .
# set style line 45 lc rgb '#0b90b5' lt 1 lw 1 # --- Azul
# set style line 47 lc rgb '#058cba' lt 1 lw 1 # --- Azul
# set style line 49 lc rgb '#0088bf' lt 1 lw 3 # --- Azul

#Verde Claro a verde Oscuro
set style line 1  lc rgb '#88f051' lt 1 lw 3 # --- Verde claro
set style line 3  lc rgb '#82ea4d' lt 1 lw 1 #      .
set style line 5  lc rgb '#7ce44a' lt 1 lw 1 #      .
set style line 7  lc rgb '#77de46' lt 1 lw 1 #      .
set style line 9  lc rgb '#71d843' lt 1 lw 1 #      .
set style line 11  lc rgb '#6bd240' lt 1 lw 1 #      .
set style line 13  lc rgb '#66cd3c' lt 1 lw 1 #      .
set style line 15  lc rgb '#60c739' lt 1 lw 1 #      .
set style line 17 lc rgb '#5ac136' lt 1 lw 1 #      .
set style line 19 lc rgb '#55bb32' lt 1 lw 1 #      .
set style line 21 lc rgb '#4fb52f' lt 1 lw 1 #      .
set style line 23  lc rgb '#49af2b' lt 1 lw 1 #      .
set style line 25  lc rgb '#44aa28' lt 1 lw 1 #      .
set style line 27  lc rgb '#3ea425' lt 1 lw 1 #      .
set style line 29  lc rgb '#389e21' lt 1 lw 1 #      .
set style line 31  lc rgb '#33981e' lt 1 lw 1 #      .
set style line 33  lc rgb '#2d921b' lt 1 lw 1 #      .
set style line 35  lc rgb '#278c17' lt 1 lw 1 #      .
set style line 37 lc rgb '#228714' lt 1 lw 1 #      .
set style line 39 lc rgb '#1c8110' lt 1 lw 1 #
set style line 41 lc rgb '#167b0d' lt 1 lw 1 #      .
set style line 43 lc rgb '#11750a' lt 1 lw 1 #      .
set style line 45 lc rgb '#0b6f06' lt 1 lw 1 # 		.
set style line 47 lc rgb '#056903' lt 1 lw 1 # 		.
set style line 49 lc rgb '#006400' lt 1 lw 3 # --- vede Oscuro


#Estilos de los ejes 
set style line 300 lc rgb 'gray40' lt 1 lw 5 
set border 3 back ls 300 lw 1.5 
set tics nomirror

#Estilo de la grilla
set style line 400 lc rgb 'gray40' lt 0 lw 1 
set grid back ls 400


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",16" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",16" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-600:]
	set yrange [:1500]


#Graduacion del eje x e Intervalos entre las marcas mayores
	#set xtics 10
	#set mxtics 2

#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 250	
	#set mytics 2


#Ploteo todas las funciones que les digamos

#Curva 1 --> Au desnudo
#Curva 3 --> Adsorbido
#Curva 27 --> desubicada 
#Curva 55 --> desubicada
#Texto
#set label 1 at  50, 250 '\hl{\small $t_\textrm{Nc}$}' center rotate by 45 front
set label at -310,755 "t" font ",8" rotate by 62 textcolor rgb "gray40" front
set label at -307,830 "i" font ",8" rotate by 50 textcolor rgb "gray40" front
set label at -304,870 "e" font ",8" rotate by 45 textcolor rgb "gray40" front
set label at -297,930 "m" font ",8" rotate by 41 textcolor rgb "gray40" front
set label at -284,1020 "p" font ",8" rotate by 34 textcolor rgb "gray40" front
set label at -275,1090 "o" font ",8" rotate by 16 textcolor rgb "gray40" front

#Para graficar todas
plot for [i=7:25:2] 'Ru10mM.txt' using i:(column(i+1)/0.0314) w lines ls i-4, \
for [i=29:51:2] 'Ru10mM.txt' using i:(column(i+1)/0.0314) w lines ls i-6, \
'Ru10mM.txt' u 5:($6/0.0314) with lines ls 1, \
'Ru10mM.txt' u 53:($54/0.0314) with lines ls 49,  "flecha.txt" u 1:2 smooth bezier ls 100, "flecha.txt" u 3:4:($5*3):($6*3) w vectors arrowstyle 200 #"flecha.txt" with points
