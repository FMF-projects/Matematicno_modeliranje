function v = bezier_der(b,t)
% ODVOD_BEZIER izracuna tangentni vektor na Bezierovo krivuljo pri
% parametru t.
% Stolpci matrike b so kontrolne tocke Bezierove krivulje.

n = size(b,2) - 1;

% Najprej izracunamo preme diference kontrolnih tock dP_i = b_{i+1} - b_i
dP = b(:,2:end)-b(:,1:(end-1));


% tangentni vektor
v = n*deCasteljau(dP,t);
end

