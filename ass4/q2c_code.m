N = 10;
% Givens
r0 = 0.1;
Rt = 10;
p0 = 1;

e = ones(N+1,1);
s = (1:N+1)';

% Construct the stiffness/mass matrix
A = spdiags([-e 2*e -e], -1:1, N+1, N+1);
C = spdiags([-s 2*s-1 -s+1], -1:1, N+1, N+1);

A(1,:) = 0;
C(1,:) = 0;
C(1,1) = 1;

A(N+1,:) = 0;
C(N+1,:) = 0;
C(N+1,N+1) = N;

% Construct values b_m
b_m = zeros(1,N+1);
b_m(1) = p0; % only b_1 is non-zero, it looks like

P = ((r0/h-1/2).*A + C) \ b_m';

syms r;
p_exact(r) = (log(r) - log(Rt)) / (log(r0) - log(Rt));

clf('reset');
hold on;

x_smooth = r0:0.001:Rt;
plot(x_smooth, p_exact(x_smooth), '-k');
x_vec = linspace(r0, Rt, N + 1);
plot(x_vec, P, ':ok');

legend('p_{exact}', 'FEM: N=10');
