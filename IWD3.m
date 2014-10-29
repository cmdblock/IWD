clear all;
clc;
N_IWD=30;
N_C=100;
a_v=1000;
b_v=0.01;
c_v=1;
a_s=1000;
b_s=0.01;
c_s=1;
InitSoil=1000;
InitVel=100;
epsilon_s=0.01;
epsilon_v=0.0001;
rho=0.9;
T_B=10000;
radius=20;

for i=1 : N_C
    city_set(1,i)=i;
end

for i=1 : N_C
    for j=1 : N_C
        soil(i,j)=InitSoil;
    end
end

for i=1 : N_C
    tmp_sita=2*pi*i/N_C;
    z3(i)=radius*cos(tmp_sita);
    z4(i)=radius*sin(tmp_sita);
end

for i=1 : N_C
%     tmp_rand=randi(N_C,1,1);
    c(i).x=z3(i);
    c(i).y=z4(i);
    z1(i)=c(i).x;
    z2(i)=c(i).y;
%     display(c(1,i).x^2+c(1,i).y^2);
end


%%
vel_IWD=cell(N_IWD,1);
for k=1 : N_IWD
    vel_IWD{k,1}(1,1)=InitVel;
end
v_c=cell(N_IWD,1);
for i=1 : N_IWD
    v_c{i,1}=floor(random('unif',1,N_C));
%     v_c{i,1}=mod(i,N_C);
end
probability_IWD=cell(N_IWD,1);
delta_soil=zeros(N_IWD,1);

for nc=1 : N_C
    for k=1 : N_IWD
        tmp_sum=sum_f_soil(v_c{k,1}(1,length(v_c{k,1})),k,soil,v_c,city_set,epsilon_s);
        for m=1 : N_C
            if (~ismember(m,cell2mat(v_c(k,1))))
                probability_IWD{k,1}(v_c{k,1}(1,length(v_c{k,1})),m)=f_soil(v_c{k,1}(1,length(v_c{k,1})),m,k,soil,v_c,city_set,epsilon_s )/tmp_sum;
            end
        end
%         for m=1 : length(cell2mat(v_c(k,1)))
%             probability_IWD{k,1}(v_c{k,1}(1,length(v_c{k,1})),v_c{k,1}(1,m))=f_soil(v_c{k,1}(1,length(v_c{k,1})),v_c{k,1}(1,m),k,soil,v_c,city_set,epsilon_s )/tmp_sum;
%         end
    end

    for k=1 : N_IWD
        display(k);
        [u v]=max(probability_IWD{k,1}(v_c{k,1}(1,length(v_c{k,1})),:));
        vel_IWD{k,1}(1,length(vel_IWD{k,1})+1)=vel_IWD{k,1}(1,length(vel_IWD{k,1}))+a_v/(b_v+c_v*soil(v_c{k,1}(1,length(v_c{k,1})),v));
        delta_soil(v_c{k,1}(1,length(v_c{k,1})),v)=a_s/(b_s+c_s*time(v_c{k,1}(1,length(v_c{k,1})),v,vel_IWD{k,1}(1,length(vel_IWD{k,1})),epsilon_v,c));
%         vel_IWD{k,1}(length(vel_IWD{k,1})+1,v)=vel_IWD{k,1}(length(vel_IWD{k,1}),v)+a_v/(b_v+c_v*soil(v_c{k,1}(1,length(v_c{k,1})),v));
%         delta_soil(v_c{k,1}(1,length(v_c{k,1})),v)=a_s/(b_s+c_s*time(v_c{k,1}(1,length(v_c{k,1})),v,vel_IWD{k,1}(length(vel_IWD{k,1}),v),epsilon_v,c));
        soil(v_c{k,1}(1,length(v_c{k,1})),v)=(1-rho)*soil(i,j)-rho*delta_soil(v_c{k,1}(1,length(v_c{k,1})),v);
        soil_IWD(k,1)=soil(k,1)+delta_soil(v_c{k,1}(1,length(v_c{k,1})),v);
        v_c{k,1}(1,length(v_c{k,1})+1)=v;
    end
    if (length(v_c{1,1})==N_C)
        break;
    end
end
%%
for k=1 : N_IWD
    Tour_IWD(k,1)=vector_distance(cell2mat(v_c(k,1)),z1,z2);
end

[u2 v2]=min(Tour_IWD);
soil(length(v_c{v2,1})-1,length(v_c{v2,1}))=(1-rho)*soil(length(v_c{v2,1})-1,length(v_c{v2,1}))+rho*2*soil_IWD(v2,1)/(N_C*(N_C-1));

if (T_B > u2)
    T_B=u2;
end

celldisp(v_c(v2,1));
plot(z1,z2,'ro');
hold on;
plot(z1(cell2mat(v_c(v2,1))),z2(cell2mat(v_c(v2,1))));