% Givens
r0 = 0.1;
Rt = 10;
p0 = 1;



syms r;
p_exact(r) = (log(r) - log(Rt)) / (log(r0) - log(Rt));

clf('reset');
hold on;

x_smooth = r0:0.001:Rt;
plot(x_smooth, p_exact(x_smooth))

