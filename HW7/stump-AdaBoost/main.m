clc;clear all
load('../MNIST.mat');
pattern1=5;
pattern2=10;
TAx=trainX(logical(trainY(:,pattern1)| trainY(:,pattern2)),:,:) ./ 255;
TAy=trainY(logical(trainY(:,pattern1)| trainY(:,pattern2)),:);
TY=TAy(:,pattern1);
TY = TY .* 2 - 1;
TX=reshape(TAx,[],28*28);
CTAx=testX(logical(testY(:,pattern1)| testY(:,pattern2)),:,:) ./ 255;
CTAy=testY(logical(testY(:,pattern1)| testY(:,pattern2)),:);
CX=reshape(CTAx,[],28*28);
CY=CTAy(:,pattern1);
CY = CY .* 2 - 1;
clear CTAx;
clear CTAy;
clear TAx;
clear TAy;
clear trainX;
clear trainY;
clear testX;
clear testY;
clear pattern1;
clear pattern2;
T=[TY,TX];
clear TX;
clear TY;
k=500;
A=T(randperm(length(T),k),:);
clear k;
X=A(:,2:28*28+1);
Y=A(:,1);
clear T;
clear A;
fprintf( 'starting training adaboost\n');
itera = adaboost(X,Y,CX,CY,400);
plot(itera(:,1),itera(:,3))
hold on
plot(itera(:,1),itera(:,2))