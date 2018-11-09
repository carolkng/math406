% Iteration variables
Ntime = 10;
Nitfront = 5;
N = 10;

% Given:
mup = 1;
w0 = 1;
p0 = 1;

t0 = 0;
t1 = 5;
dt = (t1-t0)/Ntime;

% Assume: 
R0 = 0.1;

syms t_sym(R_sym);
t_func(R_sym) = -(mup/w0^2) * (R_sym^2/2*log(R0/R_sym) + 1/4*(R_sym^2 - R0^2));

% R5 = R(5)
R5 = fzero(matlabFunction(t_func(R_sym)-t1), [1 5]);

clf('reset')
R_smooth = linspace(R0, R5, 1001);
plot(t_func(R_smooth), R_smooth);
xlabel('Time t');
ylabel('Radius R(t)');

tol = 0.01; % 1 percent tolerance for iteration goodness

% Construct the basic stiffness/mass matrices, b_m
e = ones(N+1,1);
s = (1:N+1)';

A = spdiags([-e 2*e -e], -1:1, N+1, N+1);
C = spdiags([-s 2*s-1 -s+1], -1:1, N+1, N+1);
b_m = zeros(1,N+1);

% Match essential BC: p(0) = p0
A(1,:) = 0;
C(1,:) = 0;
C(1,1) = 1;
b_m(1) = p0; % match coefficients

A(N+1,:) = 0;
C(N+1,:) = 0;
C(N+1,N+1) = N;

% Initialize all state variables
P = zeros(Ntime+1, N+1);
R = zeros(Ntime+1, 1);
v = zeros(Ntime+1, 1);

% Use p_exact to compute the first iteration:
syms p_exact(r, R_end);
p_exact(r, R_end) = (log(r) - log(R_end)) / (log(r0) - log(R_end));
%   - P(1,:)
%   - R(1)
%   - v(1)
dr = 0.05;
R(1) = r0 + 5*dr;
t = t_func(R(1));
v(1) = -w0^2/mup*(p_exact(r0 + (N+1)*dr, R(1)) - p_exact(r0 + N*dr, R(1)))/dr;

% implement the assignment loop
for k = 1:Ntime
    t = t + dt;
    v(k+1) = v(k);
    for itf = 1:Nitfront
        if itf == 1
            R_prev = Inf;
        end
        R(k+1) = R(k) + dt * v(k+1);
        if abs(R_prev - R(k+1)) < tol*R(k+1) 
            break 
        end
        % Recompute spacing
        h = (R(k+1) - r0)/N;
        P(k+1, :) = ((r0/h-1/2).*A + C) \ b_m';
        v(k+1) = -w0^2/mup * (P(k+1,N+1) - P(k+1,N))/h;
        R_prev = R(k+1);
    end
end

r_smooth = r0:0.001:R(Ntime);
% 
% clf('reset');
% R_matrix = zeros(Ntime+1, N+1);
% for i = 1:Ntime+1
%     R_matrix(i,:) = linspace(r0, R(i), N+1);
% end
% P(1,:) = p_exact(R_matrix(1,:),R_matrix(1,N+1));
% t_vec = 0.0486 + ((1:11)*dt - dt);
% surf(t_vec, P, R_matrix);
% xlabel('time');
% ylabel('pre (R)');
% zlabel('dis');
% 
% clf('reset');
% hold on;
% r_smooth = r0:0.001:R5;
% r_vec = linspace(r0, R5, 11);
% plot(r_smooth, p_exact(r_smooth, R5), '-k');
% plot(r_vec, P(Ntime+1, :), '*k');
% legend('p_{exact}', 'FEM: N=10');
% xlabel('r');
% ylabel('p(r,t=5)');
