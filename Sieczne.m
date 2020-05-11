function [xn, iters] = Sieczne(f, xn1, xn, accuracy, maxiters)
% funkcja Sieczne przybiża z zadaną dokładnościa
%  z zadanym ograniczeniem ilości wykonanych iteracji
%  pierwiastek zadanej funkcji f w zadanym przedziale
%  [a,b].
iters = 1;
while abs(f(xn)) > accuracy && iters <= maxiters
    xnn = (xn1 * f(xn) - xn * f(xn1)) / (f(xn) - f(xn1));
    xn1 = xn;
    xn = xnn;
    iters = iters + 1;
end
end