% Trapezium rule numerical integration

% Integrate a function f on the interval [a,b] with cells of width h.
% Returns:
%   i_trap: Trapezium rule with N cells

function I_trap = trapezium_int(f, a, b, h)

% Generate midpoints
N = (b-a)/h;
x_k = linspace(a, b, (b-a)/h + 1);
f_k = f(x_k);

I_trap = h/2*(2*sum(f_k) - f_k(1) - f_k(end));

end