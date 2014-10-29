clc;
m=17;
n=20;
r=1;
r2=cos(pi/6)*r;
my_cell(1,1).x=2;
my_cell(1,1).y=2;
for i=1 : m
    if (i >= 2)
        my_cell(i,1).x=my_cell(i-1,1).x;
        my_cell(i,1).y=my_cell(i-1,1).y+2*r2;
    end
    for j=2 : n
        if(mod(j,2)==0)
            my_cell(i,j).x=my_cell(i,j-1).x+2*r2*cos(pi/6);
            my_cell(i,j).y=my_cell(i,j-1).y+r2;
        else
            my_cell(i,j).x=my_cell(i,j-1).x+2*r2*cos(pi/6);
            my_cell(i,j).y=my_cell(i,j-1).y-r2;
        end
        display(sprintf('i=%d,j=%d',i,j));
        display(my_cell(i,j));
    end
end
axis equal;
axis([0 40 0 40]);
axis off;
hold on;
draw_cellular(my_cell,r);
hold off;