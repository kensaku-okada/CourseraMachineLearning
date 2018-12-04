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

%disp('theta');
%disp(size(theta));
%disp(theta)

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%prediction(i) = 1.0 / (1.0 + e^(-z(i)));
prediction = sigmoid(X * theta);

Regtheta = theta(2:end, :);
%cost with only theta(2:end)
JRegularization = lambda / (2 * m) * sum (Regtheta .^2);
J = 1.0 / m * sum (-y .* log(prediction) - (1 - y ) .* log(1-prediction)) + JRegularization;


RegthetaUpdate = lambda / m * theta;
RegthetaUpdate(1) = 0;

grad = (1.0 / m) * (X' * (prediction - y)) + RegthetaUpdate;

% =============================================================

end
