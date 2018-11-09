function [linear_basis_function] = N_i(i, x0, x1, N)
% Return the linear basis function at index i for a
%   general interval x0 < x < x1, with N divisions

assert(i <= N, 'No basis function exists for given i, N');
h = (x1 - x0) / N;

curr = x0 + i*h;
prev = curr - h;
next = curr + h;

syms lbf(x);

if (i == 0)
    lbf(x) = piecewise(x<curr, 0, x>next, 0, x<=next, (next-x)/h);
elseif (i == N)
    lbf(x) = piecewise(x<prev, 0, x>curr, 0, x<=curr, (x-prev)/h);
else
    lbf(x) = piecewise(x<prev, 0, x>next, 0, x<=curr, (x-prev)/h, x<=next, (next-x)/h);
end

linear_basis_function = lbf(x);
end

