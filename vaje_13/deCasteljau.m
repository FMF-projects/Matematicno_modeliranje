function tocka = deCasteljau(b,t)
% DE_CASTELJAU izracuna tocko na Bezierovi krivulji pri parametru t
% s pomocjo de Casteljauovega algoritma.
% Stolpci matrike b so kontrolne tocke Bezierove krivulje.

n = size(b,2);
for k=1:n
    for j=1:n-k
        b(:,j) = (1-t)*b(:,j) + t*b(:,j+1);
    end
end
tocka = b(:,1);
end