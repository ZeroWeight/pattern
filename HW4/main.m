clc;clear;
load('MNIST.mat');
div=cell(1,10);
mat=zeros(28,28);
%draw the plot
for i=1:10
    div{i}=testX(logical(testY(:,i)),:,:);
    subplot(1,10,i);
    mat=reshape(div{i}(1,:,:),28,28);
    imshow(mat);
end
D1testX=reshape(testX,10000,28*28) ./ 255;
D1train=reshape(trainX,60000,28*28) ./ 255;