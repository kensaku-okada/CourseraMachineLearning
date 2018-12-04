function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));
%disp('z')
%disp(z)
%disp('g')
%disp(g)
%disp('size(g)')
%disp(size(g))
%disp('numel(z)')
%disp(numel(z))
%disp('sum(size(z))')
%disp(sum(size(z)))

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

%for i = 1:sum(size(z))
for i = 1:numel(z)
%  fprintf('z:%f, i:%f \n', z(i), i);
  g(i) = 1.0 / (1.0 + e^(-z(i)));

% =============================================================

end
