function X = ver_u(u0,zac,L,M)
% VER_U resi problem simetricne diskretne veriznice
% z liho (2p+1) mnogoce clenki.
% Rezultat X je 2x(2p+2) tabela koordinat krajisc palic, kjer
% prva vrstica doloca abscise, druga pa ordinate iskanih tock.
%
% u0 ... zaceten priblizek pri iskanju nicle za U(u).
% zac = [x_0 x_n+1;y_0 y_n+1]
% (x_0,y_0),(x_n+1, y_n+1) ... obesisci veriznice.
% L ... vrstica z dolzinami palic.
% M ... vrstica z masami palic.

n = length(L);

mi = (M(1:end-1) + M(2:end)) ./ 2; % enacba (1)

p = (n-1)/2;
vsote_mi = sum(mi(1:p)); % enacba (11)
for i=2:n
    vsota = sum(mi(1:p)) - sum(mi(1:i-1));
    vsote_mi = [vsote_mi vsota];
end

% Newtonova metoda
U = @(u) sistem_u(u,zac,L,vsote_mi);
JU = @(u) jacobian_u(u,L,vsote_mi); % enacba (13)
u = newton(U,JU,u0,1e-14);

ksi = L ./ sqrt(1 + (u .* vsote_mi).^2); % enacba (8)
eta = ksi .* (u .* vsote_mi); % enacba (7)

% enacba (9)
x = cumsum(ksi) + zac(1,1); 
y = cumsum(eta) + zac(2,1);
x = [zac(1,1) x];
y = [zac(2,1) y];

X = [x; y];
end

