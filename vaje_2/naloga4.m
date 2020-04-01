f = @(x,y) sin(x.^2 - y.^4) ./ (x.^2 - y.^4);

[X,Y] = ndgrid(0:0.01:1, 0:0.01:2);
surf(X,Y,f(X,Y))

A = f(X,Y);

%zamenjamo vrednosti nan z 1
B = isnan(A);
n = find(B==1);
A(n) = 1;

