function animacija(zac,L,M,h)
% ANIMACIJA izrise animacijo, ko desni konec veriznice
% dvigamo ali spuscamo vertikalno.
% Pri tem stevilo h doloca smer in dolzino:
% negativen predznak: premik navzdol za abs(h)
% pozitiven predznak: premik navzgor za h

% zaceten priblizek pri resevanju sistema
% nelinearnih enacb.
W0 = [-1;-1];

% interval visine
a = zac(2,2);
b = a+h;

t = linspace(a,b,70);
n = length(t);


for i = 1:n
    
    % v vsakem koraku spremeni zacetno visino desnega krajisca
    zac(2,2) = t(i);
    
    X = ver_uv(W0,zac,L,M);
    
    % animacija
    hold on
    graf = plot(X(1,:),X(2,:),'b','LineWidth',3);
    tocke = plot(X(1,:),X(2,:),'ro','MarkerSize', 5,'LineWidth', 5);
    hold off
    grid on
    axis([zac(1,1) zac(1,2) -6 max(zac(2,1),zac(2,2))+abs(h)+1])
    
    pause(0.02);
    
    delete(graf)
    delete(tocke)
    
end

hold on
plot(X(1,:),X(2,:),'b','LineWidth',3)
plot(X(1,:),X(2,:),'ro','MarkerSize', 5,'LineWidth', 5);
hold off
grid on
axis([zac(1,1) zac(1,2) -6 max(zac(2,1),zac(2,2))+abs(h)+1])
    
end

