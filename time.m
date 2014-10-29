function [ out ] = time( i,j,velocity,epsilon_v,c )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述

    out=calucate_distance(i,j,c)/max(epsilon_v,velocity);

end

