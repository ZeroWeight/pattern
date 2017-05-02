function e = adaboost_error(X, y, j, a, d, c)
M = length(j);
[n,p] = size(X); 
p = zeros(n,M);
for i=1:M
    if j(i) == 0
        break;
    end
    p(:,i) = ((X(:, j(i)) <= a(i)) - 0.5) * 2 * d(i); % predicted label
end
pret = p * c;
pre = ((pret > 0) - 0.5 )*2;
e = sum((pre ~= y))/n;
end