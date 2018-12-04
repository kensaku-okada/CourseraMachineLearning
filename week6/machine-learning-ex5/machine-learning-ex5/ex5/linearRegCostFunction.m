function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

%disp('size(X)');
%disp(size(X));
%disp('size(y)');
%disp(size(y));
%disp('size(theta)');
%disp(size(theta));

prediction = X * theta;

%exclude the first element of theta when calculating the regularization term. either way is fine.
%Regtheta = [ [ 0 ]; theta([2:length(theta)])];
Regtheta = theta(2:end, :);

J = 1.0 / (2.0*m) * sum((prediction - y).^2.0) + lambda / (2.0*m) * sum((Regtheta.^2.0));

%calc dradient
ReglarizationGrad = lambda / m * theta;
ReglarizationGrad(1) = 0;
grad = (1.0 / m) * (X' * (prediction - y)) + ReglarizationGrad;



% =========================================================================

grad = grad(:);

end
