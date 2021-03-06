clc;
load('MNIST.mat');
pattern1=8;
pattern2=10;
TAx=trainX(logical(trainY(:,pattern1)| trainY(:,pattern2)),:,:) ./ 255;
TAy=trainY(logical(trainY(:,pattern1)| trainY(:,pattern2)),:);
TY=TAy(:,pattern1);
NTY=[TY,~TY];
TY = TY .* 2 - 1;
TX=reshape(TAx,[],28*28);
CTAx=testX(logical(testY(:,pattern1)| testY(:,pattern2)),:,:) ./ 255;
CTAy=testY(logical(testY(:,pattern1)| testY(:,pattern2)),:);
CTX=reshape(CTAx,[],28*28);
CTY=CTAy(:,pattern1);
NCTY=[CTY,~CTY];
CTY = CTY .* 2 - 1;
TrainPattern=[TY,TX];