clc;clear;
load feature_selection_X.txt
load feature_selection_Y.txt
M = length(feature_selection_Y);
N = 0.1 * M;
X_tenfold = zeros(10,40,1000);
Y_tenfold = zeros(10,40,2);
for i=0:1:9
    Index=randperm(M-i*N,N);
    X_tenfold(i+1,:,:) = feature_selection_X(Index,:);
    Y_tenfold(i+1,:,1) = feature_selection_Y(Index,1);
    Y_tenfold(i+1,Y_tenfold(i+1,:,1)==0,2)=1;
    Check=setdiff(1:M-i*N,Index);
    X_temp = feature_selection_X(Check,:);
    Y_temp = feature_selection_Y(Check,:);
    feature_selection_X = X_temp;
    feature_selection_Y = Y_temp;
end
clear Check feature_selection_X feature_selection_Y i Index M N X_temp Y_temp