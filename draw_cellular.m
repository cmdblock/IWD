function draw_cellular( a,r ) 
%UNTITLED3 この関数の概要をここに記述
%   詳細説明をここに記述
    [m n]=size(a);
    for i=1 : m
        for j=1 : n
            top_left.x=a(i,j).x-r*cos(pi/3);
            top_left.y=a(i,j).y-r*sin(pi/3);
            top_right.x=a(i,j).x+r*cos(pi/3);
            top_right.y=a(i,j).y-r*sin(pi/3);
            left.x=a(i,j).x-r;
            left.y=a(i,j).y;
            right.x=a(i,j).x+r;
            right.y=a(i,j).y;
            bottom_left.x=a(i,j).x-r*cos(pi/3);
            bottom_left.y=a(i,j).y+r*sin(pi/3);
            bottom_right.x=a(i,j).x+r*cos(pi/3);
            bottom_right.y=a(i,j).y+r*sin(pi/3);
            m1=[top_left.x top_right.x right.x bottom_right.x bottom_left.x left.x top_left.x];
            m2=[top_left.y top_right.y right.y bottom_right.y bottom_left.y left.y top_left.y];
            plot(m1,m2);
            fill(m1,m2,'r');
        end
    end
end

