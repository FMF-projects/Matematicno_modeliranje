function [dp] = odvod(p)
% vrne vektor koeficientov odvoda polinoma, podanega z vektorjem
% koeficientov p
n = length(p);
k = zeros(1, n-1);
for i = 1:n-1
    k(i) = (n-i) * p(i);
end

dp = (n-1:-1:1).*p(1:n-1);
end

