function [ out ] = sum_f_soil( i,k,soil,v_c,city_set,epsilon_s )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述
%     v_c{k,1}
%     display(k);
%     celldisp(v_c(k,1));
%     cell2mat(v_c(k,1));
    tmp_set1=setxor(cell2mat(v_c(k,1)),city_set);
    tmp_value=0;
    for z=1 : length(tmp_set1)
        tmp_value=tmp_value+f_soil(i,tmp_set1(1,z),k,soil,v_c,city_set,epsilon_s);
    end
    out = tmp_value;
end

