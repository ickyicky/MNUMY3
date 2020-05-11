function [x, iters] = findx(a, accuracy, estimated, maxiters)
% Funkcja find x znajduje wszystkie pierwiestki
% zadanego wielomianu w dziedzinie zespolonej
n = length(a) - 1;
x = zeros(n, 1);
iters = zeros(n, 1);

q = a;
for i = 1 : n
    [x(i), iters(i)] = MM2(q, accuracy, estimated(i), maxiters);
    q = LinDeflation(q, x(i));
end
end