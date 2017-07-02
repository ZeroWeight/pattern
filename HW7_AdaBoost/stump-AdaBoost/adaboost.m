function [itera,trainErr, testErr] = adaboost(Xtrain, ytrain, Xtest, ytest, M)

w = (1 / size(ytrain, 1)) * ones(size(ytrain)); % åˆ?å§‹åŒ–æ?ƒå€¼
itera=zeros(M,3);
j = zeros(M, 1);
a = zeros(M, 1);
d = zeros(M, 1);
c = zeros(M, 1);

trainErr = zeros(M, 1);
testErr = zeros(M, 1);
for m = 1: M
    [j(m), a(m), d(m)] = decision_stump(Xtrain, ytrain, w);
    fprintf( 'decision stump found j:%d a:%d, d:%d\n', j(m), a(m), d(m));
    
    e = decision_stump_error(Xtrain, ytrain, j(m), a(m), d(m), w);
    c(m) = log((1 - e) / e);
    w = update_weights(Xtrain, ytrain, j(m), a(m), d(m), w, c(m));
    
    trainErr(m) = adaboost_error(Xtrain, ytrain, j, a, d, c);
    testErr(m) = adaboost_error(Xtest, ytest, j, a, d, c);
    fprintf( 'Error ratio of the decision stump: %.9f\nAdaBoost training error ratio %.9f\nAdaBoost testing error ratio: %.9f\n\n', e, trainErr(m), testErr(m));
    itera(m,1)=m;
    itera(m,2)=trainErr(m);
    itera(m,3)=testErr(m);
end

end