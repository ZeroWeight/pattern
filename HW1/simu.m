function [ p,r,R ] = simu( index,size,sigma )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[x,y]=generate(size,sigma);%generate
p=polyfit(x,y,index);%cal
%cal r
y_hat=polyval(p,x);
err1=mean(y)-y_hat;
sig1=mean(y)-y;
r=sqrt((err1'*err1)/(sig1'*sig1));
%gererate another 100
[x_n,y_n]=generate(100,sigma);
%calc r
y_hat_n=polyval(p,x_n);
err2=mean(y_n)-y_hat_n;
sig2=mean(y_n)-y_n;
R=sqrt((err2'*err2)/(sig2'*sig2));
%draw
x1 = linspace(min(min(x(:),min(x_n(:)))),max(max(x(:),max(x_n(:)))));
y1 = polyval(p, x1);
figure; hold on;
plot(x, y, 'r^', x1, y1, 'k:');
tit = char( vpa(poly2sym(p), 6) );
title(tit);
end

