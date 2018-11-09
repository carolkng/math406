% Given
x0 = 0;
x1 = 1;
alpha = 0;
beta = 0;

u10 = [alpha; q1e_FEM(10)]
u20 = [alpha; q1e_FEM(20)]
u30 = [alpha; q1e_FEM(30)]

h10 = (x1-x0)/10;
h20 = (x1-x0)/20;
h30 = (x1-x0)/30;

clf('reset');
hold on;

x_vec10 = x0:h10:x1;
x_vec20 = x0:h20:x1;
x_vec30 = x0:h30:x1;
x_smooth = x0:0.001:x1;

plot(x_vec10, u10, ':*k');
plot(x_vec20, u20, '-.ok');
plot(x_vec30, u30, ':xk');

plot(x_smooth, u_ex(x_smooth), '-k');
legend('N=10', 'N=20', 'N=30', 'u_{exact}');
