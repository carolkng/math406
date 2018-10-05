% MATH 406 ASS 2: Question 1 - Numerical Integration

% 1a)
a = 0;
b = 1;
f = @(x) sin(5*x);
h = (b-a)./2.^(1:5);

I = zeros(5, 4);

for i = 1:5
	I(i, :) = [midpoint_int(f, a, b, h(i)), trapezium_int(f, a, b, h(i)), simpson_int(f, a, b, h(i)), gauss_int(f, a, b, h(i))];
end

disp(f)
disp(1/5*(1-cos(5)))
disp(I)

% 1b)
a = 0;
b = pi;
f = @(x) sin(2*x).^2;
h = (b-a)./2.^(1:5);

I = zeros(5, 4);

for i = 1:5
	I(i, :) = [midpoint_int(f, a, b, h(i)), trapezium_int(f, a, b, h(i)), simpson_int(f, a, b, h(i)), gauss_int(f, a, b, h(i))];
end

disp(f)
disp(1/2*pi)
disp(I)

% 1c)
a = 0;
b = 2;
f = @(x) x.^(1/3);
h = (b-a)./2.^(1:5);

I = zeros(5, 4);

for i = 1:5
	I(i, :) = [midpoint_int(f, a, b, h(i)), trapezium_int(f, a, b, h(i)), simpson_int(f, a, b, h(i)), gauss_int(f, a, b, h(i))];
end

disp(f)
disp(3*2^(-2/3))
disp(I)

% 1d)
a = 0;
b = 1;
f = @(x) (-log(x)).^(0.5);
h = (b-a)./2.^(1:5);

I = zeros(5, 2);

for i = 1:5
	I(i, :) = [midpoint_int(f, a, b, h(i)), gauss_int(f, a, b, h(i))];
end

disp(f)
disp(1/2*pi^(0.5))
disp(I)

