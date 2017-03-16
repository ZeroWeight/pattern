%select data
index=[TY(:,1)==1,TY(:,1)==0];
TX_1=TX(index(:,1),2:N-1);
TX_0=TX(index(:,2),2:N-1);
means=[mean(TX_1,1);mean(TX_0,1)];
DX_1=TX_1-repmat(means(1,:),length(TX_1(:,1)),1);
S_1=zeros(N-2,N-2);
DX_0=TX_0-repmat(means(2,:),length(TX_0(:,1)),1);
S_0=zeros(N-2,N-2);
for i=1:length(DX_1(:,1))
    S_1=S_1+DX_1(i,:)'*DX_1(i,:);
end
for i=1:length(DX_0(:,1))
    S_0=S_0+DX_0(i,:)'*DX_0(i,:);
end
S_w=S_1+S_0;
W=S_w^(-1)*((means(1,:)-means(2,:))');

W_0=-0.5*W'*(means(1,:)+means(2,:))'-log(sum(index(:,2))/sum(index(:,1)))/(sum(index(:,2))+sum(index(:,1))-2);