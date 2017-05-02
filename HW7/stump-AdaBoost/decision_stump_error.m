function e = decision_stump_error(X, y, j, a, d, w)
% 给定决策树桩和返回错误率
%
% Input
%     X : n * p 矩阵, 每一行都是一个样本
%     y : n * 1 向量, 每一行是一个标签
%     j : 所选特征
%     a : 所选阈值
%     d : 1 或者 -1
%
% 输出
%     e : 决策树桩预测错误 

p = ((X(:, j) <= a) - 0.5) * 2 * d; % predicted label
e = sum((p ~= y) .* w);

end