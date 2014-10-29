function [ output ] = delta_soil_calculation( i,j,vel,a_s,b_s,c_s,N_IWD )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述

    output=a_s/(b_s+c_s*time(i,j,vel,N_IWD));
end

