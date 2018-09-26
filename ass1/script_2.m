% MATH 406: ASS1 Q2: Lagrange interpolation basis functions
clf('reset');
hold on;

xk = [0, 0.2, 0.3, 0.4, 0.6, 0.7].';
fxk = cos(xk);
denom = ones(numel(xk), 1);

for i = 1:numel(xk)
    for j = 1:numel(xk)
        if i ~= j
            denom(i) = denom(i) * (xk(i) - xk(j));
        end
    end
end

% l_1(x) actually omits point 2 in 1-based indexing
basis1 = @(x) (x - xk(1)).*(x-xk(3)).*(x-xk(4)).*(x-xk(5)).*(x-xk(6))/denom(2);
% l_3(x) actually omits point 4 in 1-based indexing
basis3 = @(x) (x - xk(1)).*(x-xk(2)).*(x-xk(3)).*(x-xk(5)).*(x-xk(6))/denom(4);

basis0 = @(x) (x - xk(2)).*(x-xk(3)).*(x-xk(4)).*(x-xk(5)).*(x-xk(6))/denom(1);
basis2 = @(x) (x - xk(1)).*(x-xk(2)).*(x-xk(4)).*(x-xk(5)).*(x-xk(6))/denom(3);
basis4 = @(x) (x - xk(1)).*(x-xk(2)).*(x-xk(3)).*(x-xk(4)).*(x-xk(6))/denom(5);
basis5 = @(x) (x - xk(1)).*(x-xk(2)).*(x-xk(3)).*(x-xk(4)).*(x-xk(5))/denom(6);

p5x = @(x) basis0(x)*fxk(1) + basis1(x)*fxk(2) + basis2(x)*fxk(3) + basis3(x)*fxk(4) + basis4(x)*fxk(5) + basis5(x)*fxk(6); 
x = linspace(0, 0.7, 100);

disp(["Lagrange p_5(0.5): ",p5x(0.5)]);
disp(["cos(0.5): ", cos(0.5)]);

% Plot for 2a)
figure(1)
plot(x, basis1(x), 'k-');
plot(x, basis3(x), 'k--');
plot(xk, basis1(xk), 'kx');
plot(xk, basis3(xk), 'r*');

plot(x, ones(numel(x), 1), 'b:','HandleVisibility','off');
plot(x, zeros(numel(x), 1), 'k:','HandleVisibility','off');

legend('y = l_1^{(5)}(x)', 'y = l_3^{(5)}(x)', 'y = l_1^{(5)}(x_k)', 'y = l_3^{(5)}(x_k)');

% Plot for 2b)
hold on;
figure(2)
plot(x, p5x(x), 'b.');
plot(x, cos(x));
legend('y = p_5(x)', 'y = cos(x)');

% Plot to check all the basis functions
hold on;
figure(3)
plot(x, basis1(x), 'k-');
plot(x, basis3(x), 'k--');
plot(x, basis2(x), 'b-');
plot(x, basis4(x), 'b--');
plot(x, basis0(x), 'r-');
plot(x, basis5(x), 'r--');
plot(xk, basis0(xk), 'r*');
plot(xk, basis1(xk), 'r*');
plot(xk, basis2(xk), 'r*');
plot(xk, basis3(xk), 'r*');
plot(xk, basis4(xk), 'r*');
plot(xk, basis5(xk), 'r*');
plot(x, ones(numel(x), 1), 'b:','HandleVisibility','off');
plot(x, zeros(numel(x), 1), 'k:','HandleVisibility','off');

hold off;