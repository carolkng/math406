% Gauss quadrature numerical integration

% Integrate a function f on the interval [a,b] with cells of width h.
% Returns:
%   i_gauss: Calculated using 3 point Gauss quadrature on each interval

function I_gauss = gauss_int(f, a, b, h)

% Zeros and weights for 3-point Gauss quad, from lecture 10
Z = [-sqrt(3/5) 0 sqrt(3/5)];
W = [5/9 8/9 5/9];
h_k = h/2;

% Generate midpoints, leftpoints, rightpoints, for Gauss integration
x_mid = h*(1:(b-a)/h) + a - (0.5)*h;
x_l = x_mid + h_k * Z(1);
x_r = x_mid + h_k * Z(3);

I_gauss = h_k * (W(1)*sum(f(x_l)) + W(2)*sum(f(x_mid)) + W(3)*sum(f(x_r)));

end