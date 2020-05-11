function [x, iters] = FalsePosition(f, a, b, accuracy, maxiters)
% Funkcja FalsePosition oblicza za pomocą
% metody regula falsi przybliżony pierwastej
% zadanej funkcji w zadanym przedziale
iters = 1;
while true && iters <= maxiters
    c = ( a * f(b) - b * f(a)) / (f(b) - f(a));
    if abs(f(c)) <= accuracy
        break;
    end
    
    if f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
    iters = iters + 1;
end

x = c;
end