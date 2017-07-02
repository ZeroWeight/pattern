clear; 
clc;
load('X.txt');
load('Y.txt');
%without corr
x=[ones(size(X(:,1))) X];
b=regress(Y,x);
%with corr
x_n=[ones(size(X(:,1))) X X(:,1).*X(:,3) X(:,2).*X(:,3) ];
b_n=regress(Y,x_n);