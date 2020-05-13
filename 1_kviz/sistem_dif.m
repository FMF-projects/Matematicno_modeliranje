function [M,b] = sistem_dif(a,b,n)
%iscemo na intervalu a,b

g = @(x) 1.2 .* (exp(cos(x./10)) + 1000.*cos(100.*x));

h = (b-a)/(n+1); % spustili smo robna clena
X = a + (1:n)*h;

%s = find(X==1);

b = g(X) .* h^2;
% zacetni pogoji
y0 = -10;
yn = 10;
b(1) = b(1) - y0 + 0.9*h*y0/2;
b(n) = b(n) - yn - 0.9*h*yn/2;

y1 = 1 - 0.9/2*h;
y2 = 1 + 0.9/2*h;
%y3 = -2 + 0.1*h^2;

A1 = [0 y1 * ones(1,n-1)];
A2 = -2 * ones(1,n);
%A2 = y3 * ones(1,n);
A3 = [y2 * ones(1,n-1) 0];
M = [A1' A2' A3'];
end

