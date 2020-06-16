function [P] = mojrand(p,q,a,c,m,x0)
%zgenerira matriko P nakljucnih stevil
%pametna izbira zacetnih parametrov je
% a=13, c=0, m=31, x0=1

P = ones(p,q);
f = @(x) mod(a*x + c, m);

x = x0;
for i=1:p
    for j=1:q
        x=f(x);
        P(i,j) = x;
    end
end
P = P ./ m;
end

