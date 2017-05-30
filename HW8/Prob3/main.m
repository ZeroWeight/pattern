dataload;
e = zeros(1,10);
n=50;
index = zeros(10,n);
for i = 1:1:10
    Train_index = setdiff(1:10,[i]);
    TX = reshape(X_tenfold(i,:,:),40,1000);
    X = reshape(X_tenfold(Train_index,:,:),40*9,1000);
    TY = reshape(Y_tenfold(i,:,:),40,2);
    Y = reshape(Y_tenfold(Train_index,:,:),40*9,2);
    index(i,:) = select(X,Y,n);
    X_=X(:,index(i,:));
    TX_=TX(:,index(i,:));
    [~,e(i)]=train_network(X_,Y,TX_,TY);
    a=e(i)
end