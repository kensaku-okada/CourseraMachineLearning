function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network

%Theta1: 25 , 401 
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
%disp('size(Theta1)');
%disp(size(Theta1));

%Theta2: 10 , 26 
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
%disp('size(Theta2)');
%disp(size(Theta2));
                 
% Setup some useful variables
m = size(X, 1);
%disp('m')
%disp(m)
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

%disp('size(nn_params)');
%disp(size(nn_params));
%disp('input_layer_size');
%disp(input_layer_size);
%disp('hidden_layer_size');
%disp(hidden_layer_size);
%disp('num_labels');
%disp(num_labels);
%disp('size(X)');
%disp(size(X));
%disp('size(y)');
%disp(size(y));
%disp('lambda');
%disp(lambda);

%recode the output variable
yBinaryMatrix = zeros(m , num_labels);
for i = 1:m
  yBinaryMatrix(i,y(i)) = 1;
endfor

%step1 for Backpropagation
%a1 = 5000, 401
a1 = [ones(m, 1) X];
%z2 = 5000, 25
z2 =  a1 * Theta1';
%a2 = 5000, 26
a2 = [ones(m, 1) sigmoid(z2)];
%z3 = 5000, 10 (=num_labels)
z3 =  a2 * Theta2';
%a3 = 5000, 10
a3 = sigmoid(z3);
h = a3;


%y = 5000, 10
%J = 1 / m * sum(sum(-y .* log(h)) - sum((1 - y) .* log(1-h)) );
J = 1 / m * sum(sum(-yBinaryMatrix .* log(h) - (1 - yBinaryMatrix) .* log(1-h)));

%the theta (weights) for bias terms should not be considered when calculation the regularization term
Jreg = lambda / (2*m) * (sum(sum(Theta1(:, 2:end) .^2)) + sum(sum(Theta2(:, 2:end) .^2)));

J += Jreg;

%%%%%%%%%%%%%%%%%%calc the grad%%%%%%%%%%%%%%%%%%%
deltaAll = zeros();

%step2
%delta3 = 5000, 10
delta3 = a3 - yBinaryMatrix;

%step3
%z2 = 5000, 25
%delta3 = 5000, 10
%Theta2: 10 , 26 
%delta2 = 5000, 25
%remove the weight for bias term
delta2 = delta3 * Theta2(:, 2:end) .* sigmoidGradient(z2);

%step4
%delta2 = delta2(:, 2:end); <- done at step3

%delta3 = 5000, 10
%a2 = 5000, 26
%Delta2 = 10, 26
Delta2 = delta3' * a2;
%disp('size(Delta2)');
%disp(size(Delta2));

%delta2 = 5000, 25
%a1 = 5000, 401
%Delta1 = 25, 401
Delta1 = delta2' * a1;
%disp('size(Delta1)');
%disp(size(Delta1));

% step 5
%Theta1: 25 , 401 
%Theta2: 10 , 26 
%Theta2_grad = 1 / m * Delta2; 
%Theta1_grad = 1 / m * Delta1;
Theta2_grad = 1 / m * Delta2 + lambda / m * [zeros(size(Theta2), 1) Theta2(:, 2:end)]; 
Theta1_grad = 1 / m * Delta1 + lambda / m * [zeros(size(Theta1), 1) Theta1(:, 2:end)];

%calc the grad
%for j = 1 : m
%  delta
%  
%  
%endfor

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
