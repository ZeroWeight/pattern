%select data
index=[TY(:,1)==1,TY(:,1)==0];
TX_1=TX(index(:,1),:);
TX_0=TX(index(:,2),:);
mean_1=mean(TX_1,2);
mean_0=mean(TX_0,2);