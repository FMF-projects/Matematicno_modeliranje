function r = razdalja_bezier(b,t0)
% izracuna razdaljo med tockama na bezierjevi
% krivulji, ki jih dobimo z t1,t2
% t0 = [t1 t2]

T1 = deCasteljau(b,t0(1));
T2 = deCasteljau(b,t0(2));
r = norm(T1 - T2);
end

