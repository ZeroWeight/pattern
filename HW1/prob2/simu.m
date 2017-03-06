function [ p,r,R ] = simu(index,X,Y,X_n,Y_n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
p=polyfit(X,Y,index);%cal
%cal r
y_hat=polyval(p,X);
err1=mean(Y)-y_hat;
sig1=mean(Y)-Y;
r=sqrt((err1'*err1)/(sig1'*sig1));
err=polyval(p,X_n)-Y_n;
err2=err'*err/100;
R=sqrt(err2);
%draw
x1 = linspace(min(min(X(:),min(X_n(:)))),max(max(X(:),max(X_n(:)))));
y1 = polyval(p, x1);
plot(X, Y, 'r^', x1, y1, 'k:');
t=sprintf('r=%.3f\nR=%.3f',r,R);
text(max(max(X(:),max(X_n(:))))-1,polyval(p,min(min(X(:),min(X_n(:)))))+1,t)
tit = char( vpa(poly2sym(p), 6));
title(tit);
end

