% Finite elements
N = 10; 

% Given
x0 = 0;
x1 = 1;
alpha = 0;
beta = 0;

h = (x1-x0)/N;

e = ones(N,1);

% Finite difference matrix
F = 1/h^2 * spdiags([e -2*e e], -1:1, N, N);
% Neumann BC at u(1) 
F(1,1) = 1;
F(N,N-1) = -1/h;
F(N,N) = 1/h;

A = spdiags([e], 0, N, N);

[V,D] = eig(full(F), -1*full(A));
V;
diag(D)'
