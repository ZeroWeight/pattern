Check=setdiff(1:M,Train);
Cdata=data(Check,:);
CY=(Cdata(:,N)==4);
CX=Cdata(:,2:(N-1));
yy=CX*W+W_0;
yy=(yy>0);
test=(yy==CY);
mean(test)