function [y,A,b] = Thomas(A,b)
% Thomasov algoritem modificira A ter b
% in reši sistem

n = length(b);
% najprej matriko zreduciramo na zgornje
% trikotno in sproti popravljamo b
for i=1:n-1
   % v algoritmu iz prvega stolpca vzamemo i
   % v tem primeru pa i+1 ker je dodana 0 na zacetku
   A(i+1,2) = A(i+1,2) - A(i+1,1)/A(i,2)*A(i,3);
   b(i+1) = b(i+1) - A(i+1,1)/A(i,2)*b(i);
end

% resimo sistem z obratno substitucijo
y = zeros(1,n);
y(n) = b(n)/A(n,2);
for i=n-1:-1:1
   y(i) = 1/A(i,2) * (b(i) - A(i,3)*y(i+1));  
end
end

