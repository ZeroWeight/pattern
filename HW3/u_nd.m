clc;clear;
count=100;
X=zeros(1,count);
for j=1:1:3
    X=rand(1,count);
    m=mean(X);
    sigma=(X-m)*(X-m)'/count;
    s1=normpdf([m-3*sigma:1e-5:m+3*sigma],m,sigma);
    plot([m-3*sigma:1e-5:m+3*sigma],s1);
    hold on;
end
s1=ones(1e3+1);
plot([0:1e-3:1],s1,'--');