function risi_veriznica(zac,L,M)
% RISI_VER_UV narise sliko veriznice
%
% Vhodni parametri:
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci.
% L je vrstica, ki doloca dolzine palic.
% M je vrstica, ki doloca mase palic.
W = [-1,-1];
X = ver_uv(W,zac,L,M);

plot(X(1,:),X(2,:))
grid on

end

