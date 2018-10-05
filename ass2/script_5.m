% MATH 406 ASS 2: Question 5

% Estimating where I_2 < tolerance
x0 = 5;
test_f = @(x) exp(-x) - 10^-5;
b = fzero(test_f, x0);

disp("Estimate of when I_2 < 10^(-5)");
disp(b)

f = @(x) cos(x).^2 .* exp(-x);
a = 0;
tol = 0.0001;
kmax = 8;
[Int, I, X] = Romberg(f,a,b,tol,kmax);

