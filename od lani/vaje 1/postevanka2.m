function [postevanka] = postevanka2()
% vpraša uporabnika za števili a in b
% tabelira poštevanko in izpiše matriko velikosti a*b

a = input('Vnesite stevilo a: ');
b = input('Vnesite stevilo b: ');

postevanka = (1:a)'*(1:b);

end