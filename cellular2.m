m=20;
n=20;
r=1;
r2=r*cos(pi/6);
cellular_network(1,1).x=2;
cellular_network(1,1).y=2;
for i=1 : m
    if (i >= 2)
        cellular_network(i,1).x=cellular_network(i-1,1).x;
        cellular_network(i,1).y=cellular_network(i-1,1).y+2*r2;
    end
    for j=2 : n
        if (mod(j,2)==0)
            cellular_network(i,j).x=cellular_network(i,j-1).x+2*r2*cos(pi/6);
            cellular_network(i,j).y=cellular_network(i,j-1).y+2*r2*sin(pi/6);
        else
            cellular_network(i,j).x=cellular_network(i,j-1).x+2*r2*cos(pi/6);
            cellular_network(i,j).y=cellular_network(i,j-1).y-2*r2*sin(pi/6);
        end
    end
end
axis equal;
% axis([0 40 0 40]);
axis off;
hold on;
draw_cellular(cellular_network,r);
hold off;
