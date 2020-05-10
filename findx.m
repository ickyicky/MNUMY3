function x = findx(a, accuracy, estimated)
% Funkcja find x znajduje wszystkie pierwiestki
% zadanego wielomianu w dziedzinie zespolonej
n = length(a) - 1;
x = zeros(n, 1);

q = a;
for i = 1 : n
    x(i) = MM2(q, accuracy, estimated(i));
    q = LinDeflation(q, x(i));
end
end