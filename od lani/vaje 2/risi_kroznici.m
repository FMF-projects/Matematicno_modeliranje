function [] = risi_kroznici(K)
% narise vcrtano in ocrtano kroznico trikotniku s koordinatami v K
A = K(:,1);
B = K(:,2);
c = K(:,3);

end

% premica je matrika: prvi stolpec zacetna tocka
%                     drugi stolpec smerni vektor

function [p] = simetrala_daljice(A,B)
v1 = B - A; % vektor AB
v2 = [-v1(2) v1(1)] % vektor pravoten na v1
S = (A+B) ./ 2;
p = [S v2];
end

function [S] = simetrala_kota(p1,p2) % bolje bi bilo uporabiti tocke?
%izracunamo kot med premicama
% smerna vektorja
s1 = p1(:,2);
s2 = p2(:,2);

v1 = s1 ./ norm(s1);
v2 = s2 ./ norm(s2);

s = v1 + v2;
P = presecisce_premic(p1,p2);
S = [P s];
end

function [P] = presecisce_premic(p1,p2)
% smerna vektorja
s1 = p1(:,2);
s2 = p2(:,2);

% zacetni tocki
A = p1(:,1);
B = p2(:,1);

P = (B-A)\(s1-s2);
end

function [] = ocrtana_kroznica(A,B,C)

end

function [] = trikotnik(A,B,C)







