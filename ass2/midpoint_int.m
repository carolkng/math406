% Midpoint rule numerical integration

% Integrate a function f on the interval [a,b] with cells of width h.
% Returns:
%   i_mid:  Midpoint rule with N cells

function I_mid = midpoint_int(f, a, b, h)

% Generate midpoints
x_k = h*(1:(b-a)/h) + a - (0.5)*h;
I_mid = h*sum(f(x_k));

end