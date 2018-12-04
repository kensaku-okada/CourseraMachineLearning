function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1); %history of the cost function

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    prediction = X * theta;
    
%    disp ('theta')
%    disp (theta)
%    disp (size(theta))
%    disp('prediction - y')
%    disp(prediction - y)
%    disp('X')
%    disp(X)
    
%    theta = theta - alpha * (1.0 / m) * (X' * prediction - y);
    theta = theta - alpha * (1.0 / m) * (X' * (prediction - y));
    
%    if iter % 100 = 0,
%      disp ('iter')
%      disp(iter)
%    disp ('theta')
%    disp (theta)
%    disp (size(theta))
    

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
%    fprintf('J_history(%d): %f', iter, J_history(iter))

end

end
