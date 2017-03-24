Check=setdiff(1:M,Train);
Cdata=data(Check,:);
CY=(Cdata(:,N)==4);
CX=Cdata(:,2:(N-1));
yy=CX*W;
y0=zeros(1,length(yy));
y1=zeros(1,length(yy));
r0=zeros(1,length(yy));
r1=zeros(1,length(yy));
for i=1:length(yy)
    y0(i)=sum(normpdf(yy(i),TX_0*W,1))/length(TX_0);
    y1(i)=sum(normpdf(yy(i),TX_1*W,1))/length(TX_1);
end
r0=10*y1*length(TX_1);
r1=1*y0*length(TX_0);
yy=(r0>r1)';
test=(yy==CY);
mean(test)
% select
index=CY(:,:)==1;
mean(yy(index,:))

index=CY(:,:)==0;
1-mean(yy(index,:))

