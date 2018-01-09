#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
set terminal tikz
set output "VelocidadesCal_Fe.tikz" 

#Leyenda
	set key top left Left reverse samplen -2 font ",14" textcolor rgb "black"

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

#Defino estilos para cada tipo de linea
set style line 1 lc rgb 'black' pt 7 ps 1 lw 1#Cuadrado
set style line 2 lc rgb 'black' pt 9 ps 1.5  #Circulo
set style line 3 lc rgb 'red' lw 2 pt 7 ps 9 #Triangulo 
set style line 4 lt 0 lc rgb 'black'  lw 3

#Estilos de los ejes 
set style line 10 lc rgb 'gray40' lt 1 lw 5 
set border 3 front ls 10 lw 1.5
set tics nomirror font ",14"
set xtics offset 0,-0.2
set ytics offset 0.7,0

#Estilo de la grilla
set style line 11 lc rgb 'gray40' lt 0 lw 1 
set grid front ls 11

#Coloca los nombre de los ejes
	set xlabel "$v^{1/2}$ / $\\text{mV.s}^{-1}$"  font ",14" textcolor rgb "gray40" offset  0,-2
	set ylabel "j$_p$ / $\\mu \\text{A.cm}^{-2}$"	font ",14" textcolor rgb "gray40" offset -2,0

#Fuerza a establecer un rango
	 
	#set xrange [0:180]
#	set yrange [-1000:1000]
#FITEO
	 f(x) = a*x + b
	 fit f(x) "VelocidadesCal_Fe.txt" using (sqrt($1)):($3) via a,b
	 stat "VelocidadesCal_Fe.txt" using (sqrt($1)):($3)
	 set label 1 sprintf("y=%3.3fx%3.2f",a,b) at 6.95,2500 font ",12" textcolor rgb "black"
	 set label 2 sprintf("R=%3.4f",STATS_correlation) at 6.95,1500 font ",12" textcolor rgb "black"

	 g(x) = c*x + d
	 fit g(x) "VelocidadesCal_Fe.txt" using (sqrt($1)):($5) via c,d
	 stat "VelocidadesCal_Fe.txt" using (sqrt($1)):($5)
	 set label 5 sprintf("y=%3.3fx%3.2f",c,d) at 6.95,-1500 font ",12" textcolor rgb "black"
	 set label 6 sprintf("R=%3.4f",STATS_correlation) at 6.95,-2500 font ",12" textcolor rgb "black"	

	 # h(x) = e*x + f
	 # fit h(x) "Barrido-Ru1mM-Max-Min-GAMRY.txt" using (log10($1)):(log10($5)) every ::5::8 via e,f
	 # stat "Barrido-Ru1mM-Max-Min-GAMRY.txt" using (log10($1)):(log10($5))
	 # set label 3 sprintf("y=%3.3fX + %3.3f",e,f) at 4,1.57 font ",6" textcolor rgb "gray40"
	 # set label 4 sprintf("R=%3.4f",STATS_correlation) at 4,1.5 font ",6" textcolor rgb "gray40"	
 



#EL valor 4.01 corresponde al pico maximo en la oxidación.
#
#plot "Barrido-Ru1mM-Max-Min.txt" using (log10($1)):(log10($3)) with points ls 1, f(x) with lines ls 2
plot "VelocidadesCal_Fe.txt" using (sqrt($1)):($3) with points ls 1 title "Corriente \'anodica",\
f(x) with lines ls 3 notitle ,\
"VelocidadesCal_Fe.txt" using (sqrt($1)):($5) with points ls 2 title "Corriente cat\'odica",\
g(x) with lines ls 3 notitle #h(x) with lines ls 2 notitle