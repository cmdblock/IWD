function [ output ] = vector_distance( vel,z1,z2)
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述
    output=0;
    for i=1 : length(vel)-1
%         output=output+calucate_distance(c(vel(1,i)),c(vel(1,i+1)),c);
          output=output+sqrt((z1(i)-z1(i+1))^2+(z2(i)-z2(i+1))^2);
    end

end

