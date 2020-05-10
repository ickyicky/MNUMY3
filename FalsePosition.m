function x = FalsePosition(f, a, b, accuracy)
% Funkcja FalsePosition oblicza za pomocą
% metody regula falsi przybliżony pierwastej
% zadanej funkcji w zadanym przedziale
while true
    c = ( a * f(b) - b * f(a)) / (f(b) - f(a));
    if abs(f(c)) <= accuracy
        break;
    end
    
    if f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
end

x = c;
end