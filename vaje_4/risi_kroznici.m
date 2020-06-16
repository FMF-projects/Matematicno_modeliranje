function [] = risi_kroznici(X,Y)
    % X vektor x koordinat, Y vektor y koordinat
    
    %ocrtan krog
    [A1, s1] = simetrala_daljice([X(1) X(2)], [Y(1) Y(2)]);
    [A2, s2] = simetrala_daljice([X(1) X(3)], [Y(1) Y(3)]);
    
    A = presecisce_premic(A1,s1',A2,s2');
    r1 = sqrt((X(1) - A(1))^2 + (Y(1) - A(2))^2);
    
    % vcrtan krog
    [B1, v1] = simetrala_kota(X,Y);
    [B2, v2] = simetrala_kota(X*[1 0 0;0 0 1;0 1 0], Y*[1 0 0;0 0 1;0 1 0]);
    
    B = presecisce_premic(B1,v1,B2,v2);
    r2 = sqrt(((X(1) + X(2))/2 - B(1))^2 + ((Y(1) + Y(2))/2 - B(2))^2);

end