clc;
clear;
alpha=0.0001;
learn_ratio=0.7;
%load the data set
data=load('Breast_Cancer_Wisconsin_data.txt');
[M,N]=size(data);
%Get the result where 1 is malignant
Y=(data(:,N)==4);
X=data(:,1:(N-1));
%format the ones(constant)
X(:,1)=ones(1,M);

Train=randperm(M,floor(M*learn_ratio));
Tdata=data(Train,:);
TY=(Tdata(:,N)==4);
TX=Tdata(:,1:(N-1));
TX(:,1)=ones(1,floor(M*learn_ratio));
theta=zeros((N-1),1);
delta=TX'*(sigmoid(TX*theta)-TY);
i=0;
pre=delta'*delta;
now=0;
while(now/pre<1-10^-20 || now/pre>1+10^-20)
    pre=now;
    theta=theta-alpha*delta;
    delta=TX'*(sigmoid(TX*theta)-TY);
    now=delta'*delta;
end