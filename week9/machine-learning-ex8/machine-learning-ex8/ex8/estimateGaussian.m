function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.


disp('size(X)');
disp(size(X));

%my own program
for i = 1: n
  mu(i, :) = 1 / m * sum(X(:, i));

  endfor
disp('mu')
disp(mu)
  
  
for j = 1 : n
  for k = 1: m
%    sigma2(j, :) = sigma2(j, :) + 1 / m * sum((X(k,j) - mu(j))**2.0);
    sigma2(j, :) = sigma2(j, :) + 1 / m * (X(k,j) - mu(j,1))**2.0;
%    disp('sum((X(k,j) - mu(j))*2.0)')
%    disp(sum((X(k,j) - mu(j))*2.0))
  endfor
endfor

disp('sigma2')
disp(sigma2)

%build in
%mu = mean(X)';
%sigma2 = var(X)' * (m - 1) / m;
%disp('mu')
%disp(mu)
%disp('sigma2')
%disp(sigma2)



% =============================================================

end
