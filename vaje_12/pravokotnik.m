function P = pravokotnik(b)
% PRAVOKOTNIK doloci pravokotnik, ki vsebuje vse kontrolne tocke
% Bezierove krivulje.
% b je tabela 2x(n+1) kontrolnih tock po stolpcih
% Pravokotnik P je dolocen s tabelo 2x4 oglisc po stolpcih

xmin = min(b(1,:));
xmax = max(b(1,:));
ymin = min(b(2,:));
ymax = max(b(2,:));

% zacnemo zgoraj levo in v smeri urinega kazalca
P = [xmin xmax xmax xmin; ymax ymax ymin ymin];
end

