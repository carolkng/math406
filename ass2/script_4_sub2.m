% MATH 406 ASS 2: Question 4 (cont'd)

f = @(x) (cos(x) - 1 - x.^2/2) .* x.^(-1/2); % Subtract 1 term

a = 0;
b = (pi/2);
h1 = 2^(-4);
h2 = 2^(-6);

I_matrix = [[midpoint_int(f, a, b, h1), midpoint_int(f, a, b, h2)]
            [gauss_int(f, a, b, h1),    gauss_int(f, a, b, h2)]
            [trapezium_int_nan(f, a, b,h1), trapezium_int_nan(f, a, b,h2)]];

I_matrix = I_matrix + (2*pi)^(1/2) + (pi/2)^(5/2) / 5; % Add back integral of term 1 and term 2

disp("Target answer: 1.95490284858");

disp("Subtract 2 terms integrals");
disp(I_matrix);
