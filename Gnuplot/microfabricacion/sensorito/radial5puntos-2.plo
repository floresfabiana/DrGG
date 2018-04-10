#Para ver en pantalla
#reset
set terminal wxt

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
    set grid polar 45

npoints = 5
a1 = 360/npoints*1+18
a2= 360/npoints*2+18
a3= 360/npoints*3+18
a4= 360/npoints*4+18
a5= 360/npoints*5+18
set arrow nohead from 0,0 to 4.3*cos(a1) , 4.3*sin(a1)
set arrow nohead from 0,0 to 4.3*cos(a2) , 4.3*sin(a2)
set arrow nohead from 0,0 to 4.3*cos(a3) , 4.3*sin(a3)
set arrow nohead from 0,0 to 4.3*cos(a4) , 4.3*sin(a4)
set arrow nohead from 0,0 to 4.3*cos(a5) , 4.3*sin(a5)

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

set xrange [-4.5:4.5]
set yrange [-4.5:4.5] 


#set_label(x, text) = sprintf("set label '%s' at (6500*cos(%f)), (6500*sin(%f))     center", text, x, x) #this places a label on the outside

#here all labels are created
set label "(0:4)" at 4.3*cos(a1) , 4.3*sin(a1) center offset char 0,1
set label "(-400:400)" at 4.3*cos(a2) , 4.3*sin(a2) center offset char -2,1
set label "(0:4)" at 4.3*cos(a3) , 4.3*sin(a3) center offset char 0,1
set label "(0:4)" at 4.3*cos(a4) , 4.3*sin(a4) center offset char 0,1
set label "(-400:400)" at 4.3*cos(a5) , 4.3*sin(a5) center offset char 2,1
#eval set_label(0, "0")
#eval set_label(60, "60")
#eval set_label(120, "120")
#eval set_label(180, "180")
#eval set_label(240, "240")
#eval set_label(300, "300")


set style line 11 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style fill transparent solid 0.35 
#El potencial sumado (potencial+400)/200 para que encaje en un rango de 0 a 4, con esto el rango de potencial va de -400 a 400 mV
#and finally the plot
plot "prueba1.txt" u 1:2 t "Ru ciclo 1" with filledcurve ls 11,\
"prueba1.txt" u 1:3 t "Ru ciclo 25" with filledcurve ls 12,\
"prueba1.txt" u 1:4 t "RU ciclo 50" with filledcurve ls 13
