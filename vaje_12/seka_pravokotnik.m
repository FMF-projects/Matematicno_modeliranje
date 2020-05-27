function seka = seka_pravokotnik(l,P)
% SEKA_PRAVOKOTNIK doloci, ali premica l seka pravokotnik P ali ne.
% Premica l je podana v obliki l = [tocka; smerni].
% Pravokotnik P je dolocen s tabelo 2x4 oglisc po stolpcih

% oglisce bomo primerjali glede na normalo premice,
% saj mora biti potem skalarni produt z vsemi oglisci
% enako predznacen

normala = [0 -1; 1 0]*l(:,2);
normala = normala/norm(normala);

seka = 0;
for i=1:4
   oglisce = P(:,i) - l(:,1); % odstejemo zacetno tocko
   produkt = dot(normala, oglisce);
   seka = seka + sign(produkt);
end

if abs(seka) == 4
    seka = 0;
else
    seka = 1;
end

end

