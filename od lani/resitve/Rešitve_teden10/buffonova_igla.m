function pi_approx = buffonova_igla(l,t,N)
% BUFFONOVA_IGLA aproksimira stevilo pi preko simulacije
% Buffonove igle. Iglo dolzine l mecemo na povrsino z narisanimi
% vzporednimi crtami, ki so na razdalji t. Velja: l<=t
% Verjetnost, da igla seka eno od crt je enaka
%
% P = 2*l/(pi*t)
%
% Ce vrzemo iglo N-krat in prestejomo, kolikrat igla seka crto (K),
% dobimo aproksimacijo za pi po formuli
%
% pi = 2*l*N/(t*K)

% K = stevilo igel, ki seka vzporedne crte
K = 0;

for i = 1:N

    % igla je dolocena z d (razdalja razpolovisca do najblizje crte)
    % in kotom theta
    d = t/2*rand();
    theta = pi*rand();
    
    if d < l/2*sin(theta)
        K = K + 1;
    end
    
end

pi_approx = 2*l*N/(t*K);

end

