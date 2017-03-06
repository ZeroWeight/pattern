clear
clc
%notice : comment the ad choice or the basic choice
% generate the data
[X1,Y1]=generate(10,0.5);
[X2,Y2]=generate(100,0.5);
[X3,Y3]=generate(100,0.5);

[X4,Y4]=generate(10,2);
[X5,Y5]=generate(100,2);
[X6,Y6]=generate(100,2);
r=zeros(6,1);
R=zeros(6,1);
% 10 element 
for i=1:3
    subplot(2,3,i);
    hold on;
    %[temp,r(i),R(i)]=simu(i,X2,Y2,X3,Y3);%ad prob.
    [temp,r(i),R(i)]=simu(i,X1,Y1,X3,Y3);%basic prob.
    hold off;
end
% 100 element
for i=1:3
    subplot(2,3,i+3);
    hold on;
    %[temp,r(i),R(i)]=simu(i,X5,Y5,X6,Y6);%ad prob.
    [temp,r(i),R(i)]=simu(i,X4,Y4,X6,Y6);
    hold off;
end
