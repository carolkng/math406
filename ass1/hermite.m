% Piecewise cubic Hermite interpolant

% Generates CHIP based on the following inputs:
%   x - sampled points
%   y - value of function at samples x
%  yp - value of derivative at samples x
%  xi - (sorted) points for which you want the interpolant value

function H = hermite(x, y, yp, xi)
    H = zeros(numel(xi),1);
    for i = 1:numel(x)-1
        S = find(xi>=x(i) & xi<=x(i+1));
        j = min(S);
        k = max(S);
        H(j:k) = hermite2(x(i:i+1), y(i:i+1), yp(i:i+1), xi(j:k));
    end
end