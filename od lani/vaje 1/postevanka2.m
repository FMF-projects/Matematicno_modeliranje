function [postevanka] = postevanka2()
% vpra�a uporabnika za �tevili a in b
% tabelira po�tevanko in izpi�e matriko velikosti a*b

a = input('Vnesite stevilo a: ');
b = input('Vnesite stevilo b: ');

postevanka = (1:a)'*(1:b);

end