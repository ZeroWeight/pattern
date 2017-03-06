function [ x,y ] = generate( size,sigma )
%generate Summary of this function goes here
%   Detailed explanation goes here
%   generate the array according to the problem
theta1=3.5;
theta0=0.6;
x=zeros(size,1);
y=zeros(size,1);
for i=1:size
    x(i)=normrnd(0,1);
    y(i)=normrnd(0,sigma);
end
y=y+theta0+theta1*x;
end

