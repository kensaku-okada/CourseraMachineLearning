
A = magic(5);

disp (A);
%B = magic(5) + 0.1;
%disp (B);
%A (:, 3:5) = B (:, 1:3);
%disp (A);

disp(max(A, [], 2));
disp(max(A, [], 1));
%disp(max(A, 1));

[A_row, A_row_index]= max(A, [], 2);
[A_column, A_column_index]= max(A, [], 1);

disp(A_row_index);
disp(A_column_index);


