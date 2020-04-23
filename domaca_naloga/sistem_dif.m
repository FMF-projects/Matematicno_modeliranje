function [M,b] = sistem_dif(a,b,n)
%iscemo na intervalu a,b

g = @(x) 0.9 .* (exp(x.*exp(-x)) + ((1-2.*x)./50 - 900.*cos(30.*x) + 60.*sin(30.*x)));

h = (b-a)/(n+1); % spustili smo robna clena
X = a + (1:n)*h;

%s = fix(n/2) + 1
%X(s)

b = g(X) .* h^2;
% zacetnih pogoji
y0 = 1;
yn = 2;
b(1) = b(1) - y0 + 1.1*h*y0/2;
b(n) = b(n) - yn - 1.1*h*yn/2;

y1 = 1 - 1.1/2*h;
y2 = 1 + 1.1/2*h;

A1 = [0 y1 * ones(1,n-1)];
A2 = -2 * ones(1,n);
A3 = [y2 * ones(1,n-1) 0];
M = [A1' A2' A3'];
end

