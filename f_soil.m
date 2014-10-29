function [ d ] = f_soil(i,j,k,soil,v_c,city_set,epsilon_s )
%UNTITLED3 この関数の概要をここに記述
%   詳細説明をここに記述
    d=1/(epsilon_s+g_soil(i,j,k,soil,v_c,city_set));

end

