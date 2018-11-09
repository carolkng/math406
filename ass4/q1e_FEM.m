function [u] = q1e_FEM(N)
% Returns the values at the nodes u1...uN for the BVP in question 1

% Given
x0 = 0;
x1 = 1;
alpha = 0;
beta = 1;
k = 10;

syms f(x);
f(x) = x^3;
u_ex(x) = (500*x^2 - 30*x + 4853*sec(10)*sin(10*x))/50000;

% Construct the stiffness and mass matrices:
h = (x1-x0)/N;

e = ones(N,1);

% Stiffness matrix
A = spdiags([-e 2*e -e], -1:1, N, N);
A(N,N) = A(N,N) - 1;
A(1,1) = A(1,1);

% Mass matrix
M = spdiags([e 4*e e], -1:1, N, N);
M(N,N) = M(N,N) - 2;
M(1,1) = M(1,1);

% Set up b_m
b_m = 1:N;
for i = b_m
    b_m(i) = -int(f(x) * N_i(i, x0, x1, N), [x0 x1]);
end

b_m(1) = b_m(1) + alpha*(1/h + k^2*h/6);
b_m(N) = b_m(N) + beta;

% Solve for the coefficients
u = (1/h*A - k^2*h/6*M)\b_m';

end

