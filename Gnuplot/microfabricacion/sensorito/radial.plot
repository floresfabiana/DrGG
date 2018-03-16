#Para ver en pantalla
#reset
#set terminal qt

#Para exportar como latex
#set terminal tikz 
#set output "CV_ideal-pdmza1.tikz" 

#Tipo de grafico
set polar
set angles degrees
set size square 

#Saco la leyenda
	unset key

#Saco el borde
unset border

#Estilo de la grilla
	set style line 11 lc rgb 'gray70' lt 0 lw 1 
	set grid back ls 11
    set grid polar 30 


#set xrange [-6000:6000] #make gnuplot to go until 6000
#set yrange [-6000:6000]

#set xtics axis #disply the xtics on the axis instead of on the border
#set ytics axis
unset raxis
set xtics scale 0 #"remove" the tics so that only the y tics are displayed
set ytics scale 0
set rtics scale 0
set ytics format ""
set xtics format ""
set rtics format ""
#set xtics ("" 1000, "" 2000, "" 3000, "" 4000, "" 5000, "" 6000) #set the xtics only go from 0 to 6000 with increment of1000 but do not display anything. This has to be done otherwise the grid will not be displayed correctly.
#set ytics 0, 1000, 6000 #make the ytics go from the center (0) to 6000 with incrment of 1000




#set_label(x, text) = sprintf("set label '%s' at (6500*cos(%f)), (6500*sin(%f))     center", text, x, x) #this places a label on the outside

#here all labels are created
#eval set_label(0, "0")
#eval set_label(60, "60")
#eval set_label(120, "120")
#eval set_label(180, "180")
#eval set_label(240, "240")
#eval set_label(300, "300")


set style line 11 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style fill transparent solid 0.35 

#and finally the plot
plot "-" u 1:2 t "Max strain" with filledcurve ls 11
0 3400
60 5300
120 4700
180 3800
240 4100
300 3100
360 3400
e