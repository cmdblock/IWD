vx = 40;
t = 0:0.01:10;
x = vx*t;
y = -9.8*t.^2/2;
comet(x,y,0.1)