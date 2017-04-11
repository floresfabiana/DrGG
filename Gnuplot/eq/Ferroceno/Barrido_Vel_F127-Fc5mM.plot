#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "Barrido_Vel_F127-Fc5mM.tikz" 

#Saco la leyenda
set key top left Left reverse samplen 3 font ",10" textcolor rgb "gray40"

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

red_000 = "#670106"
red_025 = "#8d0000"
red_050 = "#bf0000"
red_075 = "#e30101"
red_100 = "#ff0000"


#Defino estilos paset style line 2ra cada tipo de linea
	set style line 1 lc rgbcolor red_000 pt 1 ps 2 lw 2
	set style line 2 lc rgbcolor red_025 pt 1 ps 2 lw 2
	set style line 3 lc rgbcolor red_050 pt 1 ps 2 lw 2
	set style line 4 lc rgbcolor red_075 pt 1 ps 2 lw 2
	set style line 5 lc rgbcolor red_100 pt 1 ps 2 lw 2
	set style line 6 lc rgbcolor 'red' lt -1 pt -1

#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 11 lc rgb 'gray40' lt 0 lw 1 
	set grid back ls 11


#Graduacion del eje y e Intervalos entre las marcas mayores
	#set ytics 10 
	#set mytics 2 

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/}mV$" font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	#set yrange [-100:]
	set xrange [-200:600]
  

#plot "Concentraciones_Fc.txt" using ($1):($2/0.0314) with lines ls 1,"Concentraciones_Fc.txt" using ($1):($3/0.0314) with  lines ls 2, "Concentraciones_Fc.txt" using ($1):($4/0.0314) with lines ls 3
plot "fc-5mM/FC_5mM_F127_10.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 1 title "Fc 5mM, 10 mV/s",\
"fc-5mM/FC_5mM_F127_20.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 1 title "Fc 5mM, 20 mV/s",\
"fc-5mM/FC_5mM_F127_50.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 2 title "Fc 5mM, 50 mV/s",\
"fc-5mM/FC_5mM_F127_100.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 2 title "Fc 5mM, 100 mV/s",\
"fc-5mM/FC_5mM_F127_200.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 3 title "Fc 5mM, 200 mV/s",\
"fc-5mM/FC_5mM_F127_500.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 3 title "Fc 5mM, 500 mV/s",\
"fc-5mM/FC_5mM_F127_1000.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 4 title "Fc 5mM, 1000 mV/s",\
"fc-5mM/FC_5mM_F127_2000.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 4 title "Fc 5mM, 2000 mV/s",\
"fc-5mM/FC_5mM_F127_5000.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 5 title "Fc 5mM, 5000 mV/s",\
"fc-5mM/FC_5mM_F127_10000.DTA-Ciclo-1" using ($1*1000):($2*1e6/0.0314) with lines ls 5 title "Fc 5M, 10000 mV/s",\
