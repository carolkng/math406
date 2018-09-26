% Power series with power k and length N

function S = S_k_N(k, N)
    vec = (1:N).^k;
    S = sum(vec);
end