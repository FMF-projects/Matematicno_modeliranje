function [A] =blocna(n)
%vrne blocno matriko A velikosti n^2xn^2 , ki ima na diagonali matriko T

kv = n^2;
T = diag(-4*ones(n, 1)) + diag(ones(n-1, 1),1) + diag(ones(n-1, 1),-1)

% A = diag(-4*ones(kv, 1)) + diag(ones(kv-1, 1),1) + diag(ones(kv-1, 1),-1) + diag(ones(kv-n), -n) + diag(ones(kv-n), n);

% prvi obdiagonali
obdiag = ones(1, kv-1);
obdiag(n:n:kv-1) = 0;
end

