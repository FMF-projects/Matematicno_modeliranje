function Tp = presek_s_premico(b,l,tol)
% PRESEK_S_PREMICO poisce presek ravninske Bezierove krivulje 
% s premico l podano s tocko P in smernim vektorjem s
% 
% Tp je tabela tock presecisc (ce ni presecisca, vrne prazno matriko)
% b je tabela 2x(n+1) kontrolnih tock po stolpcih
% l = [P,s]
% tol je natancnost, do katere isce presecisce.

Tp = [];

% ce premica ne seka pravokotnika, potem ne seka krivulje
P = pravokotnik(b);
if seka_pravokotnik(l,P) == 0
    return
else 
    % pravokotnik dovolj majhen zato vrnemo sredisce
    if (norm(P(:,2)-P(:,1)) < tol && norm(P(:,4)-P(:,1)) < tol)
        Tp = [Tp 1/4*sum(P,2)];
    else % naredimo en korak subdivizije in spet preverimo
        [b1,b2] = sub_demo(b,0.5);
        Tp1 = presek_s_premico(b1,l,tol);
        Tp2 = presek_s_premico(b2,l,tol);
        Tp = [Tp Tp1 Tp2];
    end
end


end

