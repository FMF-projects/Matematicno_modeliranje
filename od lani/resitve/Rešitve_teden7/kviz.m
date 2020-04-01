% kviz

l = 16;

a = 0;
b = 5;

A = 5;
B = 3;

% izracun z in parametrov C,D in lambda, ki dolocajo veriznico
z = isci_z([a A],[b B],l,1,1e-10);

v = atanh((B-A)/l) + z;
u = atanh((B-A)/l) - z;

C = (b-a)/(v-u);
D = (a*v-b*u)/(v-u);
lambda = A-C*cosh((a-D)/C);

w = @(x) lambda + C*cosh((x-D)/C);

x = linspace(a,b,100);
plot(x,w(x),'LineWidth',3);
grid on

% a) ordinata tocke pri  x = 2
disp('Ordinata tocke pri x = 2 je:');
disp(w(2));

% b) najnizja tock
disp('Najnizja tocka je:');
disp(D);

% c) presecisce veriznice s premico y = x
F = @(x) w(x)-x;

options = optimoptions('fsolve','Display','none');

% zacetni priblizek odcitamo iz grafa
y = fsolve(F,0.5,options);

disp('Presecisce veriznice s premico y = x:');
disp(y);

% d) dolzina daljsega dela vrvi po rezanju 
% najprej izracunamo presecisce veriznice s premico y = 4
F = @(x) w(x)-4;

options = optimoptions('fsolve','Display','none');
a_prime = fsolve(F,0.1,options);

% dolzina je integral v mejah od a_prime do b -> analiticno integriranje
l_prime = C*(sinh((b-D)/C)-sinh((a_prime-D)/C));

disp('Odrezana dolzina veriznice je enaka:');
disp(l_prime);

% izracun ordinate tocke T1, da bo najnizja tocka imela absciso 2.5
F = @(x) najnizja_tocka(a,A,b,x,l)-2.5;

ordinata = fsolve(F,3,options);

disp('Ordinata tocke T1, da bo najnizja tocka imela absciso x = 2.5:');
disp(ordinata);


% pomozna funkcija, ki izracuna absciso najnizje tocke na veriznici
function T_min = najnizja_tocka(a,A,b,B,l)
    
    z = isci_z([a A],[b B],l,1,1e-10);

    v = atanh((B-A)/l) + z;
    u = atanh((B-A)/l) - z;

    D = (a*v-b*u)/(v-u);

    T_min = D;

end



