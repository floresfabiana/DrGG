
#Para ver en pantalla
#reset
#set terminal X11

#Para exportar como latex
set terminal tikz gparrows tikzarrows
set output "pot-int.tikz" 

#Saco la leyenda
	set key top left Left sample -1 spacing 1.3 reverse font ",12" textcolor rgb "black" 

#Saco el Borde
	unset border

#Saco las marcas
  	unset tics

set style line 1 lc rgb 'gray60' pt 9 lt 1 ps 1.25 lw 0.5 #Marron
set style line 2 lc rgb 'red' pt 7 lt 1 ps 1 lw 2.5 #ROjo
set style line 3 lc rgb 'blue' pt 5 lt 1 ps 1 lw 1 #Azul
set style line 5 lc rgb 'black' pt 13 lt 1 ps 1.25 lw 1 #Azul

#Estilos de los ejes 
	set style line 10 lc rgb 'gray20' lt 1 lw 5 
	set border 3 back ls 10 lw 1.5 
	set tics nomirror

#Estilo de la grilla
	set style line 111 lc rgb 'gray50' lt 0 lw 1 
	set grid back ls 111


#Graduacion del eje y e Intervalos entre las marcas mayores
	set xtics (-100,-125,-150,-180,-200,-225,-250,-275,-310)
	#set mytics 2 

#Pone el Titulo
	#set title "Grafico 1"


#Coloca los nombre de los ejes
	set xlabel "$\\text{Potencial pico an\'odico (}E^p_a\\text{) vs ECS / mV}$" font ",12" textcolor rgb "gray20" offset  0,-2
	set ylabel "$\\text{j}^a_p / \\mu \\text{A.cm}^{-2}$"	   font ",12" textcolor rgb "gray20" offset -2,0

#Fuerza a establecer un rango
	 
	set xrange [-100:-310]
	#set yrange [10:60]#Zirconio

#Primero con Zirconio: Zr-Meso.txt
#Segundo con zriconio: Zr2-SF.txt
# "Zr-Meso-Bis.txt" u 3:4 every ::10::90 , "Zr-Meso-Bis.txt" u 2:5 every ::2::90 ,\

#plot "Zr-Meso-Bis.txt" u 3:4 every ::1::150 ls 1, "Zr-Meso-Bis.txt" u 2:5 every ::1::150 ls 1,\
# plot "Au.txt" u 1:2 ls 2, "Au.txt" u 3:4 ls 2,\
# "APTES-10mM-ciclos-1-45.txt" u 3:4 ls 3, "APTES-10mM-ciclos-1-45.txt" u 2:5 ls 3, \
# "APTES-10mM-ciclos-45-90.txt" u 3:4 ls 3, "APTES-10mM-ciclos-45-90.txt" u 2:5 ls 3, \
# "APTES-10mM-ciclos-90-135.txt" u 3:4 ls 3, "APTES-10mM-ciclos-90-135.txt" u 2:5 every ::5::45 ls 3, \
# "APTES-1mM-ciclos-1-45.txt" u 3:4 ls 4, "APTES-1mM-ciclos-1-45.txt" u 2:5 ls 4, \
# "APTES-1mM-ciclos-45-90.txt" u 3:4 ls 4, "APTES-1mM-ciclos-45-90.txt" u 2:5 ls 4, \
# "APTES-1mM-ciclos-90-135.txt" u 3:4 ls 4, "APTES-1mM-ciclos-90-135.txt" u 2:5 ls 4, \
# "DHDP-3mM-ciclos-1-45.txt" u 3:4 ls 5, "DHDP-3mM-ciclos-1-45.txt" u 2:5 ls 5, \
# "DHDP-3mM-ciclos-45-90.txt" u 3:4 ls 5, "DHDP-3mM-ciclos-45-90.txt" u 2:5 ls 5, \


set arrow 10 from -90,158 to -315,158 nohead lc 'red'
set arrow 11 from -168,-30 to -168,615 nohead lc 'red'
set arrow 12 from -298,-30 to -298,615 nohead lc 'red'
set label "$E_{sol}^p$" at -162,-60 font ",12" textcolor rgb "red"
set label "$E_{ads}^p$" at -288,-60 font ",12" textcolor rgb "red"
set label "$j_{Au}^p$" at -75,155 font ",12" textcolor rgb "red"


plot "Au.txt" u 1:($2/0.0314) ls 2 title "Au",\
"APTES-1mM-ciclos-1-45.txt" u ($2-7):($5/0.0314) ls 3 title "SZF$^N_1$", \
"APTES-1mM-ciclos-45-90.txt" u ($2-7):($5/0.0314) ls 3 notitle, \
"APTES-1mM-ciclos-90-135.txt" u ($2-7):($5/0.0314) ls 3 notitle, \
"DHDP-3mM-ciclos-1-45.txt" u 2:($5/0.0314) ls 5 notitle, \
"DHDP-3mM-ciclos-45-90.txt" u 2:($5/0.0314) ls 5 title "SZF$^P_3$",\
"Zr-Meso-Bis.txt" u ($2-15):($5/0.0314*1.15) every ::1::150 ls 1 title "SZF",\


