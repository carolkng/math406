% Simpson's rule numerical integration

% Integrate a function f on the interval [a,b] with cells of width h.
% Returns:
%   i_simp: Simpson's rule with 2N cells

function I_simp = simpson_int(f, a, b, h)

% N intervals, assume N always even
N = (b-a)/h;
x_odd = 2*h*((1:(N/2 + 1)) - 1) + a;
x_even = 2*h*((1:(N/2)) - 1) + a + h;

f_odd = f(x_odd);
f_even = f(x_even);
I_simp = h/3*(4*sum(f_even) + 2*sum(f_odd) - f_odd(1) - f_odd(N/2+1));

end