function Z = jacobian_u(u,L,vsote_mi)
% JACOBIAN_U zgenerira Jacobijevo matriko v tocki u
% za enacb (30) iz prilozenega porocila.
% 
% Vhodni parametri:
% u ... iskana neznanka. 
% L ... vektor z dolzinami palic.
% vsote_mi ... vektor kumulativnih vsot, definiranih v (33).

w = u*vsote_mi; % formula (32)
der = (1+w.^2).^(-3/2);

Z = (-1)*sum(L.*der.*w.*vsote_mi);
end

