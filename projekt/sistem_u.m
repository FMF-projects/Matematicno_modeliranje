function U = sistem_u(u,zac,L,vsote_mi)
% SISTEM_U nastavi enacbo za simetricno diskretno 
% veriznico z liho mnogo cleni.
%
% u ... iskana neznanka
% zac = [x_0 x_n+1; y_0 y_n+1]
% (x_0,y_0),(x_n+1, y_n+1) ... obesisci veriznice.
% L ... vrstica z dolzinami palic.
% vsote_mi ... vrstica kumulativnih vsot; enacba (11)

ksi = L ./ sqrt(1 + (u .* vsote_mi).^2); % enacba (8)
U = sum(ksi) - zac(1,2) + zac(1,1); % enacba (12)
end

