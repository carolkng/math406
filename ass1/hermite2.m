% Piecewise cubic Hermite interpolant (2 points)

% Generates CHIP based on the following inputs:
%   x - sampled points (max 2)
%   y - value of function at samples x
%  yp - value of derivative at samples x
%  xi - points for which you want the interpolant value

function H = hermite2(x, y, yp, xis)
    dxi = x(2) - x(1);
    xi = x(1);
    xip = x(2);
    
    hi0 = @(x) (dxi + 2*(x-xi)).*(xip-x).^2./dxi^3;
    hip0 = @(x) (dxi + 2*(xip-x)).*(x-xi).^2./dxi^3;
    
    hi1 = @(x) (x-xi).*(xip-x).^2./dxi^2;
    hip1 = @(x) -1*(xip-x).*(x-xi).^2./dxi^2;

    ship = @(x) y(1)*hi0(x) + y(2)*hip0(x) + yp(1)*hi1(x) + yp(2)*hip1(x);
    H = ship(xis);
end