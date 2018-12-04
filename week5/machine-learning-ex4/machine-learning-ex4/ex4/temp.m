
%theta1 = [1,2,3,4,5]';
%theta2 = [6,7,8,9,10]';
%theta1 = [1,2,3,4,5,11];
%theta2 = [6,7,8,9,10,21];

%disp(theta1);
%disp(theta1(:));
%disp(size(theta1));

%conj1 = [theta1(:) ; theta2(:)];
%disp(conj1);

%conj2 = [theta1; theta2];
%disp(conj2);

%theta1Reshape = reshape(conj1(1:6), 2,3)
%theta2Reshape = reshape(conj1(7:12), 2,3)

%a = ones(5,1);
%b = [a zeros(5,1)]

y = [1 2 3 ; 5 6 7 ; 8 9 0]

%y2 = [1 2 3 ]'
%
%z = sum(y);
%
%w = sum(y, 1);
%
%w2 = sum(y, 2);
%
%y3 = y .* y2;

%y(1,2)

%y(:, 2:end)
%
%y(:, 1:end)
%
%y(:, 2)
%
%y(:, 1)
%
%y(1, :)

numel(y)

perturb(y)



