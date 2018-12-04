function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

%fprintf ('computeCost called')

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
prediction = X * theta;
%disp('prediction:');
%disp(prediction)

J = 1.0 / (2.0 * m) * sum((prediction - y) .^ 2);
%disp('J')
%disp(J)




% =========================================================================

end
