% Romberg integration

% Integrate a function f using repeated Richardson extrapolation.
% PRE: function must have a second derivative.

% Inputs:
%   tol:  prescribed tolerance
%   kmax: maximum amount of extrapolations

% Returns:
%   Integral: the approximate integral
%   I: table of extrapolated values
%   X: sample points used

function [Integral,I,X] = Romberg(f,a,b,tol,kmax)

% I(m,1) = a^m_s, I(m,n) = a^m_(s+n-1)
I = zeros(kmax, kmax);
Integral = 0;

for m = 1:kmax

    % Initial case: generate trapezium rule for two points
    if (m == 1)
        [~, I(1,1)] = trapez(f,a,b,0,1);
    else
        for n = 1:m
            if (n == 1)
                % Sample some new points via trapez
                [~, I(1,m)] = trapez(f,a,b,I(1,m-1),m);
            else
                I(n, m-n+1) = I(n-1,m-n+1+1) + (I(n-1,m-n+1+1) - I(n-1,m-n+1))/(4^(n-1) - 1);
            end
        end
    end

    if (abs(I(m,1) - Integral) < tol)
        X = a:((b - a)/2^(m-1)):b;
        Integral = I(m,1);
        return
    else
        Integral = I(m,1);
        X = a:((b - a)/2^(m-1)):b;
    end

end %for
end %function
