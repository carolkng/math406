% MATH 406 ASS 2: Question 4

f = @(x) x.^(-1/2) .* cos(x);

a = 0;
b = pi/2;
h1 = 2^(-4);
h2 = 2^(-6);

I_matrix = [[midpoint_int(f, a, b, h1), midpoint_int(f, a, b, h2)]
            [gauss_int(f, a, b, h1),    gauss_int(f, a, b, h2)]];

disp("Target answer: 1.95490284858");

disp("Direct integrals");
disp(I_matrix);
