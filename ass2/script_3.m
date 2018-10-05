% MATH 406 ASS 2: Question 3

% 1a) revisited
a = 0;
b = 1;
f = @(x) sin(5*x);
tol = 10^(-7);
kmax = 6;

[Int, I, X] = Romberg(f,a,b,tol,kmax);

disp(f)
format long;
disp("Actual value");
disp(1/5*(1-cos(5)));
disp("Romberg integral, tol = 1e-7");
disp(Int)
format;
disp("Table of extrapolated values");
disp(I)