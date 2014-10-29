for i=1 : 1000
    %tmp_sita=random('unif',0,2*pi);
    x(i)=5*cos(2*pi*i/100);
    y(i)=5*sin(2*pi*i/100);
end

% plot(x,y,'ro');
plot(x,y);