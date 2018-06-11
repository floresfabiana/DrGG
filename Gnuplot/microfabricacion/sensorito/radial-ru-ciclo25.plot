#Para exportar como latex
set terminal tikz 
set output "radial-ru-ciclo25.tikz" 

#Tipo de grafico y prporciones
set polar
set angles degrees
set size square 1,1.5
set lmargin at screen 0;

#Saco la leyenda
unset key

#Saco el borde
unset border

#Estilo de la grilla
set style line 11 lc rgb 'gray50' lt 0 lw 1 
set grid ls 11
set grid polar 30 

#Rangos, restrinjo todo entre -4 y 4 que son los valores tipicos de j/jAu
set xrange [-4:4]
set yrange [-4:4] 
set rrange [0:4] 

#Saco todo eje y marca
set xtics scale 0 #"remove" the tics so that only the y tics are displayed
set ytics scale 0
set rtics scale 0
set ytics format ""
set xtics format ""
set rtics format ""

#Ejes personalizados
set arrow nohead from 0,0 to 4.3*cos(90) , 4.3*sin(90)
set arrow nohead from 0,0 to 4.3*cos(180) , 4.3*sin(180)
set arrow nohead from 0,0 to 4.3*cos(270) , 4.3*sin(270)
set arrow nohead from 0,0 to 4.3*cos(360) , 4.3*sin(360)
set label "(0:4)" at 4.3*cos(90) , 4.3*sin(90) center offset char 0,2
set label "(0:4)" at 4.3*cos(180) , 4.3*sin(180) center offset char -2,0
set label "(0:4)" at 4.3*cos(270) , 4.3*sin(270) center offset char 0,-2
set label "(-400:400)" at 4.3*cos(360) , 4.3*sin(360) center offset char 2,0

#Estilo de los plots
set style line 11 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style line 12 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style line 13 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot
set style fill transparent  solid 0.35 

#Grafico
plot "radial-ru.txt" u 3:($5*4) with filledcurve ls 12 t "ciclo 25"
