clc;clear;
load ../trainX.txt
load ../trainY.txt
load ../testX.txt
load ../trainY.txt
load ../testY.txt
[coef,score,latent,t2] = princomp(trainX);
clc;
latent=100*latent/sum(latent);
subplot(1,2,1);
hold on
backColor = [1 1 1];
set(gca, 'color', backColor)
pareto(latent);
s=latent(1);
for i=2:1:784
    s=s+latent(i);
    if s >= 95
        break;
    end
end
mat=coef(:,[1:i]);
TrainX_PCA=trainX*mat;
TestX_PCA=testX*mat;
X0=TrainX_PCA(trainY==0,:);
X1=TrainX_PCA(trainY==1,:);
X2=TrainX_PCA(trainY==2,:);
X3=TrainX_PCA(trainY==3,:);
X4=TrainX_PCA(trainY==4,:);

%for 3D view
% scatter3(X0(:,1),X0(:,2),X0(:,3),'blue','+');
% scatter3(X1(:,1),X1(:,2),X1(:,3),'red','+');
% scatter3(X2(:,1),X2(:,2),X2(:,3),'green','+');
% scatter3(X3(:,1),X3(:,2),X3(:,3),'black','+');
subplot(1,2,2);
hold on
set(gca, 'color', backColor)
scatter(X0(:,1),X0(:,2),'blue','+');
scatter(X1(:,1),X1(:,2),'red','+');
scatter(X2(:,1),X2(:,2),'green','+');
scatter(X3(:,1),X3(:,2),'black','+');
scatter(X4(:,1),X4(:,2),'yellow','+');
clear X0 X1 X2 X3 X4 backColor
% training
% clear the useless ones 
clear X0 X1 X2 X3 X4 i s latent score mat t2 coef
% perpare for NN target
trainTarget=zeros(length(trainY),5);
trainTarget(:,1)=(trainY == 0);
trainTarget(:,2)=(trainY == 1);
trainTarget(:,3)=(trainY == 2);
trainTarget(:,4)=(trainY == 3);
trainTarget(:,5)=(trainY == 4);
testTarget=zeros(length(testY),5);
testTarget(:,1)=(testY == 0);
testTarget(:,2)=(testY == 1);
testTarget(:,3)=(testY == 2);
testTarget(:,4)=(testY == 3);
testTarget(:,5)=(testY == 4);