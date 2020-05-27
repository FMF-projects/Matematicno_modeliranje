function [b1 b2] = sub_demo(b,t)
% SUB_DEMO demonstrira en korak subdivizije za ravninsko
% Bezierovo krivuljo. Pri tem je b tabela 2x(n+1) kontrolnih tock.
% t je subdivizijski parameter 0 <= t <= 1.

b0 = b;
% vzamemo kontrolne to?ke in izvedemo de Castel..,
% da dobimo dodatne kontrolne tocke
% potrebujemo tudi vmesne rezultate, ne samo koncnih,
% ki jih shranjujemo v matriko

n = size(b,2);
B = zeros(2*n,n);
B(1,:) = b(1,:);
B(2,:) = b(2,:);
for k=1:n-1
    for j=1:n-k
        b(:,j) = (1-t)*b(:,j) + t*b(:,j+1);
    end
    B(2*k+1,:) = b(1,:);
    B(2*(k+1),:) = b(2,:);
end

% iz B vzamemo kontrolne tocke
b1 = zeros(2,n);
b2 = B(2*n-1:2*n,:);
for i=1:n
    b1(:,i) = B(2*i-1:2*i,1)';
end

% narisemo
%hold on
%plotBezier(b0)
%plotBezier(b1)
%plotBezier(b2)
%hold off
end

