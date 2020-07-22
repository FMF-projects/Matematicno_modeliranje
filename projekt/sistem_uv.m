function Z = sistem_uv(W,zac,L,vsote_mi)
% SISTEM_UV nastavi sistem dveh nelinearnih enacb za
% diskretno veriznico. To sta enacbi (30) in (31) iz
% clanka o diskretni veriznici.
%
% Vhodni parametri:
% W = [u;v], kjer sta u in v iskani neznanki.
% zac = [x_0 x_n+1;y_0 y_n+1]
% (x_0,y_0),(x_n+1, y_n+1) ... obesisci veriznice.
% L ... vrstica z dolzinami palic.
% vsote_mi ... vrstica kumulativnih vsot, definiranih v (33).

u = W(1);
v = W(2);

ksi = L ./ sqrt(1 + (v - u .* vsote_mi).^2); %(27)
eta = ksi .* (v - u .* vsote_mi); %(25)

U = sum(ksi) - zac(1,2) + zac(1,1); %(30)
V = sum(eta) - zac(2,2) + zac(2,1); %(31)

Z = [U V];
end

