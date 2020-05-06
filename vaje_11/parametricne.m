c1 = @(t) -cos(t) + 2*cos(0.5*t);
c2 = @(t) -sin(t) + 2*sin(0.5*t);

x = linspace(0,4*pi);
plot(c1(x),c2(x));


% Kolikšna je oddaljenost to?ke c(1) od koordinatnega izhodiš?a?
razdalja = norm([c1(1) c2(1)]);


% Kolikšna je dolžina L krivulje c?
syms t
c1_sym = diff(-cos(t) + 2*cos(0.5*t),t); % simbolicno izracunamo odvod v y
c1_dt = matlabFunction(c1_sym); % spremenimo v obicajno funkcijo dveh spremenljivk

c2_sym = diff(-sin(t) + 2*sin(0.5*t),t);
c2_dt = matlabFunction(c2_sym);

y = @(t) sqrt(c1_dt(t).^2 + c2_dt(t).^2);
L = integral(y,0,4*pi);


% Izra?unajte ploš?ino zanke, ki jo opiše krivulja.
z = @(t) c2_dt(t).*c1(t);
S = abs(integral(zz,0,4*pi));


% Kolikšna je predzna?ena ukrivljenost k krivulje c v to?ki c(2p)?
c1_dt_sym = diff(c1_dt,t);
c1_ddt = matlabFunction(c1_dt_sym);
c2_dt_sym = diff(c2_dt,t);
c2_ddt = matlabFunction(c2_dt_sym);

kappa = @(t) norm((c1_dt(t).*c2_ddt(t) + c1_ddt(t).*c2_dt(t)) ./ (sqrt(c1_dt(t).^2 + c2_dt(t).^2)).^3);
kappa(2*pi);


% Izra?unajte prese?iš?i krivulje c s premico y = -x?
p = @(t) c1(t) + c2(t) % y = -x
t1 = fsolve(p,2*pi);
P1 = [c1(t1) c2(t1)];
t2 = fsolve(p,3*pi);
P2 = [c1(t2) c2(t2)];


% Pri katerih vrednostih parametra t med 0 in 4pi
% je tangentni vektor vzporeden z abscisno osjo?
t3 = fsolve(c2_dt,pi);
t4 = fsolve(c2_dt,3*pi);


% Kolikšna je razdalja to?ke A(2, 2) do krivulje c?
r_do_A = @(t) sqrt((c1(t)-2).^2 + (c2(t)-2).^2);
time = linspace(0,4*pi);
R = min(r_do_A(time));


% 


