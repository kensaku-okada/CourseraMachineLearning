function out = mapFeature(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
%

%disp('X1')
%disp(X1)
%disp('X2')
%disp(X2)

degree = 6;
out = ones(size(X1(:,1)));

%disp('size(out)')
%disp(size(out))

for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
%        fprintf('end = %f \n', end+1)
    end
end

%disp('out')
%disp(out)

end