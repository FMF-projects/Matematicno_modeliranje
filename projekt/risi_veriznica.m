function X = risi_veriznica(zac,L,M)
% RISI_VERIZNICA narise sliko veriznice
% in vrne koordinate krajisc palic - X
%
% zac = [x_0 x_n+1;y_0 y_n+1]
% (x_0,y_0),(x_n+1, y_n+1) ... obesisci veriznice.
% L ... vrstica z dolzinami palic.
% M ... vrstica z masami palic.

n = length(L);
r = rem(n,2);
if r == 0 % sodo stevilo clenkov -> uporabimo postopek za splosno diskretno veriznico 
    W0 = [-1; -1]; % zacetni priblizek
    X = ver_uv(W0,zac,L,M);
    plot(X(1,:),X(2,:),'-o');
else % liho stevilo clenkov -> uporabimo prirejen postopek z eno spremenljivko
    u0 = -1; % zacetni priblizek
    X = ver_u(u0,zac,L,M);
    plot(X(1,:),X(2,:),'-o')
end
grid on
end

