function x = resi3(a,b,c,f)
% resi3: resevanje tridiagonalnega sistema, predstavljenega
% s tremi vektorji in desno stranjo
% x je resitev sistema,
% a,b,c so pod/glavna/nad diagonale dim. n-1, n, n-1, 
% f je desna stran sistema

%A = diag(a, -1) + diag(b) + diag(c, 1);
%x = A\f;

n = length(f);

% eliminacije
for i = 1:(n-1)
    faktor = a(i)/b(i);
    b(i+1) = b(i+1) - faktor*c(i);
    
    % desno stran popravljamo sproti
    f(i+1) = f(i+1) - faktor*f(i);
end

% obratna substitucija
x = zeros(n,1);
x(n) = f(n)/b(n);

for i = (n-1):-1:1
    x(i) = 1/b(i)*(f(i)-c(i)*x(i+1));
end
end

%preverjanje delovanja
% n = 4
% a = rand(n-1,1)
% b = rand(n,1)
% c = rand(n-1,1)
% A = diag(a,-1) + diag(b) + diag(c,1)
% f = A*ones(n,1)
% funkcija mora vrniti same enke

