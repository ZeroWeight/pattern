clc;clear;
load data.mat;
[sample,feature] = size(train_X);
y1 = train_Y';
y2 = zeros(sample,2);
y2(y1 == 1,1) = 1;
y2(y1 == -1,2) = 1;
fold = 10;
batch = floor(sample/fold);
X_fold = zeros(fold,batch,feature);
Y_fold = zeros(fold,batch,2);
for i=0:1:fold-1
    Index=randperm(sample-i*batch,batch);
    X_fold(i+1,:,:) = train_X(Index,:);
    Y_fold(i+1,:,1) = y2(Index,1);
    Y_fold(i+1,Y_fold(i+1,:,1)==0,2)=1;
    Check=setdiff(1:sample-i*batch,Index);
    X_temp = train_X(Check,:);
    Y_temp = y2(Check,:);
    train_X = X_temp;
    y2 = Y_temp;
end
clear Check train_X y2 i Index M N X_temp Y_temp train_Y y1
global X;global Y;
index = zeros(fold,feature);
disp 'Starting the GA method'
for i = 1:1:fold
    Train_index = setdiff(1:fold,i);
    TX = reshape(X_fold(i,:,:),batch,feature);
    X = reshape(X_fold(Train_index,:,:),batch*(fold-1),feature);
    TY = reshape(Y_fold(i,:,:),batch,2);
    Y = reshape(Y_fold(Train_index,:,:),batch*(fold-1),2);
    disp 'New iteration'
    [index(i,:),~,~,~,~,~] = ga_func_simple(feature);
end
clear Train_index i
mean(e)