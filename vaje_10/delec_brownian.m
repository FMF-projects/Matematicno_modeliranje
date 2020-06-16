function [T,info] = delec_brownian(a, b, poz, delta, N)
% Simulacija: Zacni v dani poziciji poz v pravokotniku [-a,a]x[-b,b]
% in poisci najvecji krog, ki ga lahko vrises v ta pravokotnik.
% Pojdi v nakljucno tocko na tem krogu in ce je razdalja do roba
% manjsa kot delta, %stej da si presel stranico.
% T je tabela delezev prehodov delca skozi eno od stranic pravokotnika.
% N je stevilo simulacij

info={'Desno','Levo','Gor','Dol'};
T=zeros(4,1);

% shranimo originalno pozicijo
poz1 = poz;

r = 0;

for i=1:N
    
    % dokler se ne priblizamo dovolj stranici pravokotnika, se premikam
    % "naprej"
    poz=poz1;
    zunaj=false;
    
    while ~zunaj
        
        % nakljucen kot
        phi = 2*pi*rand(); 
        poz = poz + r*[cos(phi);sin(phi)];
        
        % izracunamo polmer kroznici in stranico, kateri smo najblizje
        [r,stranica] = razdalja(poz,a,b);
        
        zunaj= (r<delta);
        
    end
    
    T(stranica) = T(stranica)+1;
end



end


function [r,stranica]=razdalja(poz,a,b)
        [r,stranica]=min(abs([a-poz(1),a+poz(1),b-poz(2),b+poz(2)]));
end
    