clc;clear;
load('MNIST.mat');
div=cell(1,10);
mat=zeros(28,28);
%draw the plot
for i=1:10
    div{i}=reshape(trainX(logical(trainY(:,i)),:,:),[],28*28);
    % plot function%
%     subplot(1,10,i);
%     mat=reshape(div{i}(1,:),28,28);
%     imshow(mat);
end
D1testX=reshape(testX,10000,28*28) ./ 255;
D1train=reshape(trainX,60000,28*28) ./ 255;
pattern1=8;
pattern2=10;
% ----- Fisher function ----- %
sigma1=1;
sigma2=1;
means=[mean(div{pattern1},1);mean(div{pattern2},1)];
DX_1=div{pattern1}-repmat(means(1,:),length(div{pattern1}(:,1)),1);
DX_0=div{pattern2}-repmat(means(2,:),length(div{pattern2}(:,1)),1);
S_w=div{pattern1}'*div{pattern1}+div{pattern2}'*div{pattern2}-length(div{pattern1})*means(1,:)'*means(1,:)-length(div{pattern2})*means(2,:)'*means(2,:);
W=S_w^(-1)*((means(1,:)-means(2,:))');
W = W ./ sqrt(W'*W);
pdf0x=[round(min(div{pattern2}*W)-3):1e-1:round(max(div{pattern2}*W)+3)];
pdf0y=zeros(1,length(pdf0x));
for i=1:length(pdf0y)
    pdf0y(i)=sum(normpdf(pdf0x(i),div{pattern2}*W,sigma2))/length(div{pattern2});
end
plot(pdf0x,pdf0y);
hold on;
pdf1x=[round(min(div{pattern1}*W)-3):1e-1:round(max(div{pattern1}*W)+3)];
pdf1y=zeros(1,length(pdf1x));
for i=1:length(pdf1y)
    pdf1y(i)=sum(normpdf(pdf1x(i),div{pattern1}*W,sigma1))/length(div{pattern1});
end
plot(pdf1x,pdf1y);
hold off


Ax=testX(logical(testY(:,pattern1)| testY(:,pattern2)),:,:);
Ay=testY(logical(testY(:,pattern1)| testY(:,pattern2)),:);
Cx=reshape(Ax,[],28*28);
Cy=Cx*W;
for i=1:length(Cy)
    Cy(i)=  sum(normpdf(Cy(i),div{pattern2}*W,sigma2))/length(div{pattern2})<  ...,
            sum(normpdf(Cy(i),div{pattern1}*W,sigma1))/length(div{pattern1});
end
test=(Cy==Ay(:,pattern1));
disp('Fisher:');
mean(test)
% ----- Logistic -----%
alpha=0.001;
TAx=trainX(logical(trainY(:,pattern1)| trainY(:,pattern2)),:,:);
TAy=trainY(logical(trainY(:,pattern1)| trainY(:,pattern2)),:);
TY=TAy(:,pattern1);
TX=[reshape(TAx,[],28*28),ones(length(TAx),1)];
theta=zeros(28*28+1,1);
delta=TX'*(sigmoid(TX*theta)-TY);
for i=1:1e3
    theta=theta-alpha*delta;
    delta=TX'*(sigmoid(TX*theta)-TY);
end


CTAx=testX(logical(testY(:,pattern1)| testY(:,pattern2)),:,:);
CTAy=testY(logical(testY(:,pattern1)| testY(:,pattern2)),:);
CTY=CTAy(:,pattern1);
CTX=[reshape(CTAx,[],28*28),ones(length(CTAx),1)];
YY=sigmoid(CTX*theta)>0.5;
test=(YY==CTY);
disp('Logistic:');
mean(test)
