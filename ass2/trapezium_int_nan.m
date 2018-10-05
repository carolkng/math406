% Trapezium rule numerical integration, NaN hack for Q4

% Integrate a function f on the interval [a,b] with cells of width h.
% Returns:
%   i_trap: Trapezium rule with N cells

function I_trap = trapezium_int_nan(f, a, b, h)

% Generate midpoints
N = (b-a)/h;
x_k = linspace(a, b, (b-a)/h + 1);
f_k = f(x_k);

f_k(isnan(f_k)) = 0; % Remove the removed singularity at 0 for Q4

I_trap = h/2*(2*sum(f_k) - f_k(1) - f_k(end));

end