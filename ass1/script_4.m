% MATH 406: ASS1 Q4: Cubic Hermite polynomials
clf('reset');
hold on;

f = @(x) x .* exp(-x);
df = @(x) exp(-x) - x .* exp(-x);

xs = [0,1,2];
ys = f(xs);
yp = df(xs);

x = linspace(xs(1),xs(numel(xs)), 101);

y = hermite(xs, ys, yp, x);
ychip = pchip(xs, ys, x);

plot(x, f(x), 'k-');
plot(x, y, 'k--');
plot(x, ychip, 'k-.');

plot(xs, ys, 'k*');

legend("y = xe^{-x}", "Interp. with slope", "pchip")
hold off;
