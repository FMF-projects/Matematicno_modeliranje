function b = bezier_quad_spline(parametrizacija)
%﻿BEZIER_QUAD_SPLINE omogoci uporabniku vpis števila odsekov
% in interaktivni vnos kontrolnih točk, nato pa narise sestavljeno
% Bezierovo krivuljo pri enakomerni parametrizaciji. 

m = input('Vnesite število odsekov sestavljene Bezierove krivulje:');

% graficni vnos tock
[x,y] = ginput(m + 2);

% kontrolne tocke kvadraticnega zlepka
b = zeros(2,2*m+1);

b(:,1:2) = [x(1:2)';y(1:2)'];
b(:,(end-1):end) = [x((end-1):end)';y((end-1):end)'];

for i = 1:(m-2)
    b(:,2+2*i) = [x(2+i)';y(2+i)'];
end

% ostale tocke izracunamo iz pogojev zvezne odvedljivosti

% odvisne so od parametrizacije
switch parametrizacija
    
    case 'enakomerna'
        u = 0:m;
        
    case 'centripetalna'
        u = zeros(1,m+1);
        
        for i = 2:(m+1)
             u(i) = u(i-1) + sqrt(norm([x(i);y(i)]-[x(i-1);y(i-1)]));
        end
        
    case 'tetivna'
        
        u = zeros(1,m+1);
        
        for i = 2:(m+1)
             u(i) = u(i-1) + norm([x(i);y(i)]-[x(i-1);y(i-1)]);
        end
end

% diference u_{i+1} - u_i
dif_u = u(2:end) - u(1:end-1); 

disp(dif_u)
         
for i = 1:(m-1)
    b(:,1+2*i) = (dif_u(i+1))/(dif_u(i)+dif_u(i+1))*b(:,2*i) + (dif_u(i))/(dif_u(i)+dif_u(i+1))*b(:,2*i+2);
end

% risanje
for i = 1:m
   
    plotBezier(b(:,(2*i-1):(2*i+1)));
    hold on
    
end

end

