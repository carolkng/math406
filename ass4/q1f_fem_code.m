clf('reset');
hold on;

% Finite elements
N = 10; 

% Given
x0 = 0;
x1 = 1;
alpha = 0;
beta = 0;

% First 3 exact solutions:
eigs = pi^2*((1:3)-1/2).^2;
c1 = 1;
syms x;
eigf1(x) = c1 * sin(sqrt(eigs(1)) * x);
eigf2(x) = c1 * sin(sqrt(eigs(2)) * x);
eigf3(x) = c1 * sin(sqrt(eigs(3)) * x);

%%%%
%%%% FEM block
%%%%
% Construct the stiffness and mass matrices:
h = (x1-x0)/N;

e = ones(N,1);

% Stiffness matrix
A = spdiags([-e 2*e -e], -1:1, N, N);
A(N,N) = A(N,N) - 1;
A = full(A);

% Mass matrix
M = spdiags([e 4*e e], -1:1, N, N);
M(N,N) = M(N,N) - 2;
B = full(h^2/6 * M);

[V_fem,D_fem] = eig(A,B);

%%%%
%%%% FD block
%%%%
e = [1;e];
% Finite difference matrix
F = 1/h^2 * spdiags([e -2*e e], -1:1, N+1, N+1);
% u(0) = 0
F(1,1) = 0;
F(1,2) = 0;
% Neumann BC at u(1) 
F(N+1,N) = -1/h;
F(N+1,N+1) = 1/h;

A = spdiags([e], 0, N+1, N+1);
% Neumann BC at u(1)
A(1,1) = 0;

[V_fd,D_fd] = eig(full(F), -1*full(A));

disp(diag(D_fem)')
disp(diag(D_fd)')

% Plot results of exact solutions
x_smooth = 0:0.005:1;
plot(x_smooth, eigf1(x_smooth), x_smooth, eigf2(x_smooth), x_smooth, eigf3(x_smooth));

% Plot results of FEM
% plot(x_vec, [0; V_fem(:,1)], 'o');
% plot(x_vec, [0; V_fem(:,2)], 'o');
% plot(x_vec, [0; V_fem(:,3)], 'o');

% Scale the solutions by an appropriate factor:
x_vec = linspace(x0, x1, N+1);
[~, max_ind] = max(abs(V_fem(:,1)));
plot(x_vec, [0; V_fem(:,1) / V_fem(max_ind,1)], 'o');
[~, max_ind] = max(abs(V_fem(:,1)));
plot(x_vec, [0; -1*V_fem(:,2) / V_fem(max_ind,2)], 'o');
[~, max_ind] = max(abs(V_fem(:,1)));
plot(x_vec, [0; V_fem(:,3) / V_fem(max_ind,3)], 'o');

% Plot results of FD approximation:

legend("Exact: V1", "Exact: V2", "Exact: V3", "FEM approx: V1", "FEM approx: V2", "FEM approx: V3");
