function w_update = update_weights(X, y, j, a, d, w, c)
p = ((X(:, j) <= a) - 0.5) * 2 * d; % predicted label
w_update = w .* exp((p ~= y) .* c);
w_update = w_update ./ (sum(w_update));
end