function [j, a, d] = decision_stump(X, y, w)
[n,p]=size(X);
sample = zeros(n,1);
e =inf;
j = 0;
dmat = zeros(1,p);
amat =zeros(1,p);
for m=1:p   % looping every feature of X
    ef=inf;
    sample = unique(sort(X(:,m))); % sort the feature
    for i=1:(length(sample)-1)
        temp = decision_stump_error(X, y, m, (sample(i)+sample(i+1))/2, 1, w);
        if ef > temp
            ef = temp;
            dmat(m) = 1;
            amat(m) = (sample(i)+sample(i+1))/2;
        end
        temp = decision_stump_error(X, y, m, (sample(i)+sample(i+1))/2, -1, w);
        if ef > temp
            ef = temp;
            dmat(m) = -1;
            amat(m) = (sample(i)+sample(i+1))/2;
        end
    end
    if e >ef
        e = ef;
        j = m;
end
a = amat(j);
d = dmat(j);
end