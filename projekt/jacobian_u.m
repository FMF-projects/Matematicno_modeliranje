function Z = jacobian_u(u,L,vsote_mi)
% JACOBIAN_U zgenerira Jacobijevo matriko v tocki u
% za funkcijo U(u)
% 
% u ... iskana neznanka. 
% L ... vrstica z dolzinami palic.
% vsote_mi ... vrstica kumulativnih vsot; enacba (11)

w = u*vsote_mi; % enacba (10)
der = (1+w.^2).^(-3/2);
Z = (-1)*sum(L.*der.*w.*vsote_mi); % enacba (13)
end

