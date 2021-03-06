clear;clc
[~, ~, raw] = xlsread('Prob1.xlsx','Sheet1','B2:I9');
mat = reshape([raw{:}],size(raw));
clearvars raw;
[~, ~, raw] = xlsread('Prob1.xlsx','Sheet1','A2:A9');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);
name = cellVectors(:,1);
clearvars raw cellVectors;
n=length(name);
E = (-0.5 * mat * mat);
Ec = mean(E,1);
Ec = repmat(Ec,n,1);
M=mean(mean(E));
M=repmat(M,n,n);
F=E-Ec-Ec'+M;
[U,S,V]=svd(F);
Y = U * sqrt(S);
scatter(Y(:,1),Y(:,2));
text(Y(:,1),Y(:,2), name, 'fontsize', 15);