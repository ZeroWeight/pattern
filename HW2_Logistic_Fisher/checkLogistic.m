Check=setdiff(1:M,Train);
Cdata=data(Check,:);
CY=(Cdata(:,N)==4);
CX=Cdata(:,1:(N-1));
CX(:,1)=ones(1,M-floor(M*learn_ratio));
yy=sigmoid(CX*theta);
yy=(yy>0.5);
test=(yy==CY);
mean(test)