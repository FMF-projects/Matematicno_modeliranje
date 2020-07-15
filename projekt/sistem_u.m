function U = sistem_u(u,zac,L,vsote_mi)
% SISTEM_U nastavi nelinearno enacbo za
% diskretno veriznico. To sta enacbi (30) in (31) iz
% prilozenega clanka.
%
% Vhodni parametri:
% W = [u;v], kjer sta u in v iskani neznanki.
% zac = [x_0 x_n+1; y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci.
% L je vrstica, ki doloca dolzine palic.
% vsote_mi je vrstica kumulativnih vsot, definiranih v (33).


ksi = L ./ sqrt(1 + (u .* vsote_mi).^2);
U = sum(ksi) - zac(1,2) + zac(1,1); %(30)
end

