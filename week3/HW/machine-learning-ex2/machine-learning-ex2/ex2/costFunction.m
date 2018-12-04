function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%disp('theta');
%disp(size(theta));
%disp(theta);
%
%disp('X');
%disp(size(X));
%disp(X);
%
%disp('y');
%disp(size(y));
%disp(y);

prediction = zeros(size(y));

z = X * theta;

%prediction = 1.0 / (1.0 + e^(-(X * theta)));
for i = 1:m
%  fprintf('z:%f, i:%f \n', z(i), i);
  prediction(i) = 1.0 / (1.0 + e^(-z(i)));

J = 1.0/ m * sum (-y .* log(prediction) - (1 - y ) .* log(1-prediction));

grad = (1.0 / m) * (X' * (prediction - y)) ;

%for iter = 1:m
%  theta = theta - alpha


% =============================================================

end
