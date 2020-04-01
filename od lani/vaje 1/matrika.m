function [X] = matrika(n)
% sestavi matriko X velikosti nxn, ki ima na diagonali števila od
% 1 do n, nad diagonalo pa povsod stevilo 4

v = 1:n;
X = diag(v);
v1 = ones(n-1,1); % drugo stevilo je 1 ker zelimo vektor
v2 = -1 * ones(n-2,1);
X1 = diag(v1, -1); % drugo stevilo je izbira diagonale (0 je glavna diag)
X2 = diag(v2, -2);
X3 = triu(4 .* ones(n), 1);

X = X + X1 + X2 + X3; 

end

