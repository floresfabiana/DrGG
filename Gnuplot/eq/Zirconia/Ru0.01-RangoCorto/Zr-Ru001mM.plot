#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz
set output "Zr-Ru001mM.tikz" 

#Saco la leyenda
	unset key

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics
set style line 1 lc rgb 'gray80' lt 1 lw 0.5 #Marron
set style line 2 lc rgb 'black' lt 1 dashtype 2 lw 2.5
set style line 3 lc rgb 'black' lt 1 lw 2.5 #Azul


#Estilos de los ejes 
	set style line 10 lc rgb 'gray40' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror font ",14"

#Estilo de la grilla
	set style line 111 lc rgb 'gray40' lt 0 lw 1 
	set grid back ls 111

#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial\\; vs\\; ESC/mV}$" font ",18" textcolor rgb "gray40" offset  0,-2
	set ylabel "$\\text{j}/ \\mu \\text{A.cm}^{-2}$"	   font ",18" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-500:0]
	set xtics offset 0,-0.3
	#set yrange [-50:50]


#Para graficar todas
filename(n) = sprintf("Zr 6 Ru 0.01 mM 12x45 Rango Corto  (20_04_2017-09_36_04)/Zr 6 Ru 0.01 mM 12x45 Rango Corto S%d  2-VC    .txt", n)
#plot for [i=2:2:1] filename(i) using 1:($2*1000/0.0314) every ::1::12000 w l ls 1,\

plot for [i=1:1:1] filename(i) using 1:($2/0.0314*1000) w l ls 1,\
for [i=1:1:1] filename(i) using 1:($2/0.0314*1000) every ::52600::54000 w l ls 3,\
"../Control_Au/Ru 0.01mM Au Rango Cort.txt" u 1:($2/70*1000) every ::4800::6000 w l ls 2,\
