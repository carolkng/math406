% MATH 406 ASS 2: Question 5

f = @(x) cos(x).^2; % has no exp part, since exp(-x) is the weight function

% Abscissae and weights obtained from:
%   http://mathworld.wolfram.com/Laguerre-GaussQuadrature.html
x_k = [0.263560   1.413400   3.59643000   7.08581000  12.64080000];
w_k = [0.521756   0.398667   0.07594240   0.00361176   0.00002337];

Int = f(x_k).*w_k;
disp("5-point Gauss Laguerre quadrature");
disp(Int);