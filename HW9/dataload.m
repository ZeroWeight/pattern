clc;clear;
load data.mat;
[sample,feature] = size(train_X);
y1 = train_Y';
y2 = zeros(sample,2);
y2(y1 == 1,1) = 1;
y2(y1 == -1,2) = 1;
e_min = inf;
for i = 1:1:1000
    [net,e]=train_network(train_X,y2);
    if e < e_min
        net_max = net;
        e_min = e;
        fprintf('%f update at iteration %d\n',e_min,i);
    end
end
y_out =net_max(test_X');
test_Y = y_out(1,:) > y_out(2,:);
test_Y = test_Y *2 -1;
save test_Y 
