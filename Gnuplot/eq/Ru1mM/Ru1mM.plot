#Para ver en pantalla
reset
set terminal x11
#set terminal aqua

#Para exportar como latex
#set terminal tikz gparrows tikzarrows
#set output "Ru1mM.tikz"

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

#Lo saque de http://www.perbang.dk/rgbgradient/
set style line 1  lc rgb '#88f051' lt 1 lw 3 # --- Verde
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
set style line 49 lc rgb '#0088bf' lt 1 lw 3 # --- Azul


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
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [-600:]
	#set yrange [:1500]


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


#Para graficar todas
#Ru_1mM_F127_50_40 Ciclos.DTA-Ciclo-1
#plot for [i=1:50] "Ru_1mM_F127_50_40 Ciclos.DTA-Ciclo-$i using 1:2 w lines ls 1

#do for [i=1:20] {plot sprintf('Ru_1mM_F127_50_40 Ciclos.DTA-Ciclo-%i',i) using 1:2}
#FILES = system("ls -1 *Ciclos.DTA-Ciclo-*")
FILES = system("ls -1 *.DTA-Ciclo-*")

plot for [data in FILES] data u 1:2 with lines ls 1



