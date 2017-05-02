function [trainErr, testErr] = adaboost(Xtrain, ytrain, Xtest, ytest, M)
% adaboost: 训练总共M个分类器的AdaBoost
%
% 输入 
%     Xtrain : n * p 矩阵, 训练数据
%     ytrain : n * 1 向量, 训练标签
%     Xtest  : nt * p 矩阵, 测试数据
%     ytest  : nt * 1 向量, 测试标签
%     M : 分类器的数目
%
% 输出
%     e_train : M * 1 向量, 训练数据的错误率
%     e_test  : M * 1 向量, 测试数据的错误率


w = (1 / size(ytrain, 1)) * ones(size(ytrain)); % 初始化权值

j = zeros(M, 1);
a = zeros(M, 1);
d = zeros(M, 1);
c = zeros(M, 1);

trainErr = zeros(M, 1);
testErr = zeros(M, 1);
for m = 1: M
    [j(m), a(m), d(m)] = decision_stump(Xtrain, ytrain, w);
    fprintf( '找到的决策树桩 j:%d a:%d, d:%d\n', j(m), a(m), d(m));
    
    e = decision_stump_error(Xtrain, ytrain, j(m), a(m), d(m), w);
    c(m) = log((1 - e) / e);
    w = update_weights(Xtrain, ytrain, j(m), a(m), d(m), w, c(m));
    
    trainErr(m) = adaboost_error(Xtrain, ytrain, j, a, d, c);
    testErr(m) = adaboost_error(Xtest, ytest, j, a, d, c);
    fprintf( '决策树桩的错误率: %f\nAdaBoost的训练错误率: %f\n测试错误率: %f\n\n', e, trainErr(m), testErr(m));
end

end