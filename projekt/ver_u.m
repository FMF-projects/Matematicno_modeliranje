function X = ver_u(u0,zac,L,M)
% VER_UV resi problem veriznice iz sistema za u in v.
% Rezultat X je 2x(n+2) tabela koordinat vozlisc, kjer
% prva vrstica doloca abscise, druga ordinate iskanih tock.
%
% Vhodni parametri:
% u0 zaceten priblizek pri resevanju sistema
% nelinearnih enacb.
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci.
% L je vrstica, ki doloca dolzine palic.
% M je vrstica, ki doloca mase palic.

n = length(L);

mi = (M(1:end-1) + M(2:end)) ./ 2;

p = (n-1)/2;
vsote_mi = sum(mi(1:p));
for i=2:n
    vsota = sum(mi(1:p)) - sum(mi(1:i-1)); %(33)
    vsote_mi = [vsote_mi vsota];
end

F = @(u) sistem_u(u,zac,L,vsote_mi);
%u = fsolve(F,u0);

% z newtonovo metodo
JF = @(u) jacobian_u(u,L,vsote_mi);
u = newton(F,JF,u0,1e-14);

vsote_mi
ksi = L ./ sqrt(1 + (u .* vsote_mi).^2)
eta = ksi .* (u .* vsote_mi)

x = cumsum(ksi) + zac(1,1);
y = cumsum(eta) + zac(2,1);

x = [zac(1,1) x];
y = [zac(2,1) y];

X = [x; y];
end

