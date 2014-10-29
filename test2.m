A=unidrnd(100,1000000,7);
B=zeros(1000000,3);
for m=1 : 1000000
    a=A(m,:);
    b=[4 6 8];
    for ii=1 : 3
        dd=a(a==b(ii));
        if isempty(dd)==0 %dd is not empty
            b(ii)=0;
        end
    end
    B(m,:)=b;
end