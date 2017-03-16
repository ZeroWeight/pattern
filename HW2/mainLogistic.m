alpha=0.0001;
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