function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.

disp('size(Theta1)');
disp(size(Theta1));
disp('size(Theta2)');
disp(size(Theta2));
disp('size(X)');
disp(size(X));



%input layer
X = [ones(m,1), X];
activation1 = X;

%hidden layer
z2 = activation1 * Theta1';
activation2 = sigmoid(z2);
activation2 = [ones(m,1), activation2];
disp('size(z2)');
disp(size(z2));

%output layer
z3 = activation2 * Theta2';
activation3 = sigmoid(z3);

[pMaxValue, pMaxValueIndex] = max(activation3, [], 2);
p = pMaxValueIndex;

% =========================================================================


end
