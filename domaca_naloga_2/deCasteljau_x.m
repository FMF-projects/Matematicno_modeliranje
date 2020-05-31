function Tx = deCasteljau_x(b,t)
% DE_CASTELJAU izracuna tocko na Bezierovi krivulji pri parametru t
% s pomocjo de Casteljauovega algoritma.
% Stolpci matrike b so kontrolne tocke Bezierove krivulje.

% vrne x koordinato
% prilagodimo za primer, ko je t vektor
n = size(b,2);
m = length(t);
T = zeros(2,m);
for i=1:m
    c = b;
    for k=1:n-1
        for j=1:n-k
            c(:,j) = (1-t(i)).*c(:,j) + t(i).*c(:,j+1);
        end
    end
    T(:,i) = c(:,1);
end
Tx = T(1,:);
end