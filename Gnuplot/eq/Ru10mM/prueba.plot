#Para ver en pantalla
reset
set terminal x11

reset
unset key
eps = 0.01

set style arrow 1 head filled size screen 0.03, 15, 45 lt -1

cut(x,x1,x3) = ((x >= x1 && x <= x1 + (1.0-eps)*(x3-x1)) ? 1.0 : 1/0)

denom(x1, x2, x3) = x1*x1*(x2-x3) + x1*(x3*x3-x2*x2) + x2*x3*(x2-x3)
A(x1,y1,x2,y2,x3,y3) = ( (x2-x3)*y1 + (x3-x1)*y2 + (x1-x2)*y3 ) / denom(x1,x2,x3)
B(x1,y1,x2,y2,x3,y3) = ( (x3*x3-x2*x2)*y1 + (x1*x1-x3*x3)*y2 + (x2*x2-x1*x1)*y3 ) / denom(x1,x2,x3)
C(x1,y1,x2,y2,x3,y3) = ( (x2-x3)*x2*x3*y1 + (x3-x1)*x1*x3*y2 + (x1-x2)*x1*x2*y3 ) / denom(x1,x2,x3)

ARROW = ""
PLOT = "p [0:3] sin(x) w p ps 1 pt 6"
arrow(x1,y1,x2,y2,x3,y3) = (new_x = x1 + (1.0-eps)*(x3-x1), \
        a = A(x1,y1,x2,y2,x3,y3), b = B(x1,y1,x2,y2,x3,y3), c = C(x1,y1,x2,y2,x3,y3), \
        PLOT = PLOT.sprintf(", cut(x,%f,%f)*(%f*x*x+%f*x+%f) with lines lt -1", x1, x3, a, b, c), \
        ARROW.sprintf("set arrow from %f, %f to %f,%f as 1; ", new_x, a*new_x*new_x + b*new_x + c, x3, y3))

ARROW = arrow(0.5,0.2,1,1.5,pi/2,1.03)
ARROW = arrow(0,0,1,0.3,pi/2,0.97)
eval(ARROW)
eval(PLOT)
