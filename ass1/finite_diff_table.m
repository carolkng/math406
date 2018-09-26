% Finite difference table for a power series with degree k

function F = finite_diff_table(k)
    N = 1:k+3;

    F = arrayfun(@(x) S_k_N(k, x), N)';
    D = diag(ones(k+3, 1));
    D = -D + [zeros(k+3,1) D(:,1:k+2)];

    for i = N
        E = k+3-i;
        F = [F D(:,1:E)*F(1:E,i)];
        % Last element correction factor
        if i ~= k+3
            F(E,i+1) = F(E,i+1) + F(E+1, i);
        end
    end
end