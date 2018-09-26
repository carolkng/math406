% MATH 406: ASS1 Q1: Least squares fitting plots

x = [0, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7].';
fx = cos(x);

a4 = least_squares_A(x, fx, 4);
a5 = least_squares_A(x, fx, 5);

p4 = polyfit(x, fx, 4);
p5 = polyfit(x, fx, 5);

disp("Comparison of least_squares output vs. polyfit");
disp([a4, p4']);
disp([a5, p5']);

y4 = @(x) a4(1)*x.^4 + a4(2)*x.^3 + a4(3)*x.^2 + a4(4)*x + a4(5);
y5 = @(x) a5(1)*x.^5 + a5(2)*x.^4 + a5(3)*x.^3 + a5(4)*x.^2 + a5(5)*x + a4(5);

x = linspace(0,0.7,1000);

disp(["Least squares p_4(0.5): ", y4(0.5)]);
disp(["Least squares p_5(0.5): ", y5(0.5)]);
disp(["cos(0.5): ", cos(0.5)]);


