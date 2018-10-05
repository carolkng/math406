% MATH 406 ASS 2: Question 2

a = 1i*pi/4;
b = 1+1i;
r = 3;

z = @(phi) r*exp(1i*phi) + b;
f = @(phi) 1/(2*pi) .* sin(z(phi)) ./ (z(phi) - a) .* r .*exp(1i.*phi);

A = 0;
B = 2*pi;
N1 = 10;
N2 = 20;
h1 = (B - A) / N1;
h2 = (B - A) / N2;

disp("Target answer:");
disp(sin(a));

disp("Gauss quadrature, N = 10");
disp(gauss_int(f, A, B, h1));
disp("Gauss quadrature, N = 20");
disp(gauss_int(f, A, B, h2));

disp("Composite trapezium, N = 10");
disp(trapezium_int(f, A, B, h1));
disp("Composite trapezium, N = 20");
disp(trapezium_int(f, A, B, h2));
