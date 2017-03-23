clc;clear;
count=100000;
X=zeros(1,count);
for j=1:1:3
    X=normrnd(0,1,1,count);
    m=mean(X);
    sigma=(X-m)*(X-m)'/count;
    s1=normpdf([m-3*sigma:1e-5:m+3*sigma],m,sigma);
    plot([m-3*sigma:1e-5:m+3*sigma],s1);
    hold on;
end
s1=normpdf([-3:1e-3:3],0,1);
plot([-3:1e-3:3],s1,'--');