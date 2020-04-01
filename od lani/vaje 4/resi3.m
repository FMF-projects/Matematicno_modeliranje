function [x] = resi3(a,b,c,f)
% reši tridiagonalni sistem linearnih enacb Ax=f,
% kjer je A podana z vektorji a,b,c

%A = diag(a, -1) + diag(b) + diag(c, 1);
%x = A\f;


%eliminacije
for i=1:(n-1)
    faktor = a(i)/b(i);
    b(i+1) = b(i+1) - faktor*c(i);
    
    %desno stran popravljamo sproti
    rhs(i+1) = rhs(i+1) - faktor*rhs(i); 
end

%obratna substitucija
x = zeros(n,1);
end

%preverjanje delovanja
% n = 4
% a = rand(n-1,1)
% b = rand(n,1)
% c = rand(n-1,1)
% A = diag(a,-1) + diag(b) + diag(c,1)
% f = A*ones(n,1)
% funkcija mora vrniti same enke