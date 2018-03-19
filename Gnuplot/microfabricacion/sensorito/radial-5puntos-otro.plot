set nokey
set polar
set angles degrees
npoints = 5
a1 = 360/npoints*1+18
a2= 360/npoints*2+18
a3= 360/npoints*3+18
a4= 360/npoints*4+18
a5= 360/npoints*5+18
set grid polar 45
set size square
set style data lines
unset border
set arrow nohead from 0,0 to first 1*cos(a1) , 1*sin(a1)
set arrow nohead from 0,0 to first 1*cos(a2) , 1*sin(a2)
set arrow nohead from 0,0 to first 1*cos(a3) , 1*sin(a3)
set arrow nohead from 0,0 to first 1*cos(a4) , 1*sin(a4)
set arrow nohead from 0,0 to first 1*cos(a5) , 1*sin(a5)
a1_max = 4
a2_max = 500
a3_max = 4
a4_max = 4
a5_max = 500
a1_min = 0
a2_min = -500
a3_min = 0
a4_min = 0
a5_min = -500
set label "(0:4)" at cos(a1),sin(a1) center offset char 1,1
set label "(-500:500)" at cos(a2),sin(a2) center offset char -1,1
set label "(0:4)" at cos(a3),sin(a3) center offset char -1,-1
set label "(-500:500)" at cos(a4),sin(a4) center offset char 0,-1
set label "(0:4)" at cos(a5),sin(a5) center offset char 3,0
set xrange [-1:1]
set yrange [-1:1]
unset xtics
unset ytics
set rtics scale 0
unset raxis
#set rrange [0:1]
set rtics format ""

plot 'radial-ru-50.txt' using ($1==1?a1:($1==2?a2:($1==3?a3:($1==4?a4:($1==5?a5:$1))))):($1==1?(($2-a1_min)/(a1_max-a1_min)):($1==2?(($2-a2_min)/(a2_max-a2_min)):($1==3?(($2-a3_min)/(a3_max-a3_min)):($1==4?(($2-a4_min)/(a4_max-a4_min)):($1==5?(($2-a5_min)/(a5_max-a5_min)):$1))))) w l
