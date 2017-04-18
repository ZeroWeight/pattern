function [cost,grad] = sparseAutoencoderCost(theta, visibleSize, hiddenSize, ...
                                             lambda, sparsityParam, beta, data)

% visibleSize: the number of input units (probably 64) 
% hiddenSize: the number of hidden units (probably 25) 
% lambda: weight decay parameter
% sparsityParam: The desired average activation for the hidden units (denoted in the lecture
%                           notes by the greek alphabet rho, which looks like a lower-case "p").
% beta: weight of sparsity penalty term
% data: Our 64x10000 matrix containing the training data.  So, data(:,i) is the i-th training example. 
  
% The input theta is a vector (because minFunc expects the parameters to be a vector). 
% We first convert theta to the (W1, W2, w1, w2) matrix/vector format, so that this 
% follows the notation convention of the lecture notes. 

W1 = reshape(theta(1:hiddenSize*visibleSize), hiddenSize, visibleSize);
W2 = reshape(theta(hiddenSize*visibleSize+1:2*hiddenSize*visibleSize), visibleSize, hiddenSize);
w1 = theta(2*hiddenSize*visibleSize+1:2*hiddenSize*visibleSize+hiddenSize);
w2 = theta(2*hiddenSize*visibleSize+hiddenSize+1:end);

% Cost and gradient variables (your code needs to compute these values). 
% Here, we initialize them to zeros. 
cost = 0;
W1grad = zeros(size(W1)); 
W2grad = zeros(size(W2));
w1grad = zeros(size(w1)); 
w2grad = zeros(size(w2));

%% ---------- YOUR CODE HERE --------------------------------------
%  Instructions: Compute the cost/optimization objective J_sparse(W,b) for the Sparse Autoencoder,
%                and the corresponding gradients W1grad, W2grad, w1grad, w2grad.
%
% W1grad, W2grad, w1grad and w2grad should be computed using backpropagation.
% Note that W1grad has the same dimensions as W1, w1grad has the same dimensions
% as w1, etc.  Your code should set W1grad to be the partial derivative of J_sparse(W,b) with
% respect to W1.  I.e., W1grad(i,j) should be the partial derivative of J_sparse(W,b) 
% with respect to the input parameter W1(i,j).  Thus, W1grad should be equal to the term 
% [(1/m) \Delta W^{(1)} + \lambda W^{(1)}] in the last block of pseudo-code in Section 2.2 
% of the lecture notes (and similarly for W2grad, w1grad, w2grad).
% 
% Stated differently, if we were using batch gradient descent to optimize the parameters,
% the gradient descent update to W1 would be W1 := W1 - alpha * W1grad, and similarly for W2, w1, w2. 
% 
[n, m] = size(data);
X1 = sigmoid(repmat(w1,1,m)+W1*data); 
X2 = sigmoid(repmat(w2,1,m)+ W2*X1);

delta = X2 - data;
delta2 = delta .* X2 .* (1-X2);
rho_hat = mean(X1, 2);
S_delta = beta * (-sparsityParam ./ rho_hat + (1-sparsityParam) ./ (1-rho_hat));
S_delta = repmat(S_delta, 1, m);
delta1 = (W2'*delta2 + S_delta) .* X1 .* (1-X1);%25*10000

w2grad = delta2(:,1)/m;
W2grad = (delta2 * X1') / m + lambda * W2;
w1grad = delta1(:,1)/m;
W1grad = delta1 * data' / m + lambda * W1;

delta_vec = delta(:);
W1_vec = W1(:); W2_vec = W2(:);
cost = 0.5 * (delta_vec'*delta_vec) / m + 0.5 * lambda * (W1_vec'*W1_vec + W2_vec'*W2_vec)+...
    beta * sum(sparsityParam * (log(sparsityParam)-log(rho_hat)) + ...
    (1 - sparsityParam) * (log(1-sparsityParam)-log(1-rho_hat)));

%-------------------------------------------------------------------
% After computing the cost and gradient, we will convert the gradients back
% to a vector format (suitable for minFunc).  Specifically, we will unroll
% your gradient matrices into a vector.
grad = [W1grad(:) ; W2grad(:) ; w1grad(:) ; w2grad(:)];

end

%-------------------------------------------------------------------
% Here's an implementation of the sigmoid function, which you may find useful
% in your computation of the costs and the gradients.  This inputs a (row or
% column) vector (say (z1, z2, z3)) and returns (f(z1), f(z2), f(z3)). 

function sigm = sigmoid(x)
  
    sigm = 1 ./ (1 + exp(-x));
end

