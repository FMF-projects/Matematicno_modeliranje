% test resevanja tridiagonalnega sistema

% velikost matrike
n = 4;

a = rand(n-1,1);
b = rand(n,1);
c = rand(n-1,1);

A = diag(a,-1) + diag(b) + diag(c,1);

f = A*ones(n,1);

x = resi3(a,b,c,f)