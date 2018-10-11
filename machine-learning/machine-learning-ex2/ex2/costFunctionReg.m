function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

t = theta';

for i = 1:m
    h = sigmoid(t * X(i,:)');
    J += -y(i) * log(h) - (1 - y(i)) * log (1 - h);
end

J /= m;

J += lambda / (2 * m) * (t * theta - t(1) * theta(1))

%
for i = 1:m
    grad(1) += (sigmoid(t * X(i,:)') - y(i)) * X(i,1);
end
grad(1) /= m;

for j = 2:length(grad)
    for i = 1:m
        grad(j) += (sigmoid(t * X(i,:)') - y(i)) * X(i,j);
    end
    grad(j) /= m;

    grad(j) += lambda / m * theta(j);
end

% =============================================================

end
