b = [0 1 2 3; 0 2 -1 1];
%deCasteljau(b,1/3)
%plotBezier(b)
%premakni_bezier(b,2)
%rotiraj_bezier(b,90)

%[b1, b2] = sub_demo(b,1/3)

l = [0 1/2; 1 0.1];
P = pravokotnik(b);
seka_pravokotnik(l,P);

hold on
plot(P(1,:),P(2,:))
plot([l(1,1) l(1,1)+l(2,1)],[l(1,2) l(1,2)+l(2,2)])
hold off