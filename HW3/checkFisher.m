Check=setdiff(1:M,Train);
Cdata=data(Check,:);
CY=(Cdata(:,N)==4);
CX=Cdata(:,2:(N-1));
yy=CX*W;
for i=1:length(yy)
    yy(i)=  sum(normpdf(yy(i),TX_0*W,1))/length(TX_0)<  ...,
            sum(normpdf(yy(i),TX_1*W,1))/length(TX_1);
end
test=(yy==CY);
mean(test)