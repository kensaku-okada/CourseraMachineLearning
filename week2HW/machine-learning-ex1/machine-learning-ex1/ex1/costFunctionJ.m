function J = costFunctionJ(X, y, theta)

  m = size(X, 1);
  predictions = X *theta;
  sqrErrors = (predictions - y) .^ 2;

%  disp(1.0 / (2.0 * m) * sum(sqrErrors));
  
  J = 1.0 / (2.0 * m) * sum(sqrErrors);
  
  