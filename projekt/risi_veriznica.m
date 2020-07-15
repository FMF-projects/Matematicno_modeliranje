function risi_veriznica(zac,L,M)
% RISI_VER_UV narise sliko veriznice
%
% Vhodni parametri:
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci.
% L je vrstica, ki doloca dolzine palic.
% M je vrstica, ki doloca mase palic.
u0 = -1;
X = ver_u(u0,zac,L,M);

W0 = [-1,-1];
Y = ver_uv(W0,zac,L,M);

plot(X(1,:),X(2,:))
%plot(Y(1,:),Y(2,:))
grid on

end

