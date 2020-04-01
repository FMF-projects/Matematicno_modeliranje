function A = MatrikaA(x,y)
% MATRIKAA za dana vektorja x in y vrne matriko A z elementi
% A(i, j) = x(i)/y(j).
% Ce je kak element v y enak 0, ga postavi na 1.
% Vektorja x in y sta podana kot stolpca.

if nargin < 2
    y = x;
end

% 1.moznost: vektorizacija:

% Postavimo nicle v vektorju y na 1.
y(y == 0) = 1;

A = x./y';

% 2.moznost: uporaba zanke for

% m = length(x);
% n = length(y);
% A = zeros(m,n);
% 
% for i = 1:length(x)
%     for j = 1:length(y)
%         if y(j) == 0
%             y(j) = 1;
%         end
%         A(i,j) = x(i)/y(j);
%     end
% end

end

