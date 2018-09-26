% Least squares fitting

% x_k and y_k are the x and y coordinates of the sampled points
% m is the degree of the polynomial you're trying to fit
% Returns the coefficients of the polynomal a_m:a_0, where:
%   p(x) = a_m(x)^m + a_(m-1)(x)^(m-1) ...  + a_1(x) + a_0

function A = least_squares_A(x_k, y_k, m)
    N = size(x_k);
    v = vander(x_k);
    v = v(:,N-m:N);
    
    % 1a) vtv is the least squares matrix, with size m-by-m
    A = (transpose(v) * v) \ (transpose(v) * y_k);
end