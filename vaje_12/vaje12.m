b = [0 1 2 3; 0 2 -1 1];
%deCasteljau(b,1/3)
%plotBezier(b)
%premakni_bezier(b,2)
%rotiraj_bezier(b,90)

%[b1, b2] = sub_demo(b,1/3)

l = [0 1/2; 1 0.1]';
%P = pravokotnik(b);
%seka_pravokotnik(l,P);

presek_s_premico(b,l,1e-8)
