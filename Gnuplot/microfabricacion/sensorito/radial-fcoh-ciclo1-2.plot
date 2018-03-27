#Para ver en pantalla
#reset
#set terminal wxt

#Para exportar como latex
set terminal tikz 
set output "radial-fcoh-ciclo1-2.tikz" 

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
set grid ls 11
set grid polar 30 

#Rangos, restrinjo todo entre -4 y 4 que son los valores tipicos de j/jAu
set xrange [-1.5:1.5]
set yrange [-1.5:1.5] 
set rrange [0:1] 

#Saco todo eje y marca
set xtics scale 0 format "" #"remove" the tics so that only the y tics are displayed
set ytics scale 0 format ""
set rtics 0.2 scale 0 format ""
unset raxis

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

#Ejes personalizados
set arrow nohead from 0,0 to 1.1*cos(45) , 1.1*sin(45)
set arrow nohead from 0,0 to 1.1*cos(90) , 1.1*sin(90)
set arrow nohead from 0,0 to 1.1*cos(180) , 1.1*sin(180)
set arrow nohead from 0,0 to 1.1*cos(270) , 1.1*sin(270)
set arrow nohead from 0,0 to 1.1*cos(315) , 1.1*sin(315)

set label "(0:1)" at 1.1*cos(90) , 1.1*sin(90) center offset char 0,1
set label "(0:1)" at 1.1*cos(180) , 1.1*sin(180) center offset char 2,-1
set label "(0:1)" at 1.1*cos(270) , 1.1*sin(270) center offset char 0,-2.5
set label "(-400:400)" at 1.1*cos(45) , 1.1*sin(45) center offset char -2,1
set label "(0:200)" at 1.1*cos(315) , 1.1*sin(315) center offset char -2,-2.5

set label "SZF \\textbar $\\;\\text{j}_p / \\text{j}^{\\text{Au}}_p$" at 1.1*cos(90) , 1.1*sin(90) center offset 0,2.5
set label "SZF$^P_3$ \\textbar $\\;\\text{j}_p / \\text{j}^{\\text{Au}}_p$" at 1.1*cos(180) , 1.1*sin(180) center offset 2,1
set label "SZF$^N_1$ \\textbar $\\;\\text{j}_p / \\text{j}^{\\text{Au}}_p$" at 1.1*cos(270) , 1.1*sin(270) center offset 0,-1
set label "$E^{\\circ}$\\textbar mV" at 1.1*cos(45) , 1.1*sin(45) center offset -2,2.5
set label "$\\Delta E$\\textbar mV" at 1.1*cos(315) , 1.1*sin(315) center offset -2,-1


#Estilo de los plots
set style line 11 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style line 12 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style line 13 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style fill transparent  solid 0.35 

#Grafico
plot "radial-fcoh2.txt" u 3:4 with filledcurve ls 13 t "ciclo 1"