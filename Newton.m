function [x, iters] = Newton(f, df, a, b, accuracy, maxiters)
% funkcja Newton znajduje przybliżenie pierwiastka
%  zadanej funkcji f w przedziale [a,b] z użyciem
%  metody Newtona. Jako że metoda Newtona polega
%  na coraz lepszym przybliżaniu wartości pierwiastka,
%  jako wartość oczątkowa brana jest wartość środkowa
%  zadanego przedziau, natomiast jako warunek zbieżności
%  metody w każdej iteracji sprawdzane jest czy kolejne
%  przybliżenie należy do zadanego przedziału.

iters = 1;
x = (a + b) / 2;
while abs(f(x)) >= accuracy && x < b && x > a && iters <= maxiters
    x = x - f(x) / df(x);
    iters = iters + 1;
end
end