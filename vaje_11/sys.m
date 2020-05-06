syms x y % x,y in rezerviramo za simbolicne izraze

derSym = diff(x^2 + y^2 - x*y - 1,y) % simbolicno izracunamo odvod v y

derFun = matlabFunction(derSym) % spremenimo v obicajno funkcijo dveh spremenljivk

clear x y % sprostimo x,y v pomnilniku