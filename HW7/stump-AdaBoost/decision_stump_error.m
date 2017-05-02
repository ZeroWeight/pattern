function e = decision_stump_error(X, y, j, a, d, w)
p = ((X(:, j) <= a) - 0.5) * 2 * d; % predicted label
e = sum((p ~= y) .* w);

end