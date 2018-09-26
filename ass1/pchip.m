% Piecewise cubic Hermite interpolant

% Generates PCHIP based on the following inputs:
%   x - sampled points
%   y - value of function at samples x
%  xi - (sorted) points for which you want the interpolant value

function P = pchip(x, y, xi)
    D = diag(ones(numel(x),1));
    D = D(1:numel(x)-1, :);
    D = -D + circshift(D, [0 1]);
    
    yp_int = D*y';
    xp_int = D*x'; % Weights of the interval slopes
    yp_int = yp_int ./ xp_int; % Interval slopes
    
    yp = zeros(numel(x), 1);
    yp(1) = yp_int(1);
    yp(numel(x)) = yp_int(numel(x)-1);
    
    for i = 2:numel(x)-1
        yp(i) = harmmean([yp_int(i-1), yp_int(i)]);
        % Don't calculate the weighted harmonic mean
        % yp(i) = (xp_int(i-1)+xp_int(i)) / (xp_int(i-1)/yp_int(i-1) + xp_int(i)/yp_int(i));
    end
    
    P = hermite(x, y, yp, xi);
end