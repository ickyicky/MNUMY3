function q = LinDeflation(a, alpha)
% Funkcja LinDeflation przeprowadza defalcje
% wielomianu o wspolczynnikach a wielomianem
% liniowym (x - alpha). Deflacja jest przeprowadzana
% tzw. sklejanym algorytmem Hornera

n = length(a);
b = zeros(1, n);
c = zeros(1, n);

b(1) = 0;
for i = 2 : n
    b(i) = a(i - 1) + alpha * b(i - 1);
end
b = b(2 : n);

c(n) = 0;
for i = n - 1 : -1 : 1
    c(i) = (c(i + 1) - a(i + 1))/ alpha;
end
c = c(1 : n - 1);

r = 1;
if imag(alpha) ~= 0
    r = 2;
end

k = 1;
minval = abs(c(1) - b(1)) ^ r / (abs(a(1)) ^ r + abs(c(1)) ^ r);
for i = 2 : n - 1
    val = abs(c(i) - b(i)) ^ r / (abs(a(i)) ^ r + abs(c(1)) ^ r);
    if val < minval
        minval = val;
        k = i;
    end
end

q = zeros(1, n - 1);
for i = 1 : k
    q(i) = c(i);
end
for i = k + 1 : n -1
    q(i) = b(i);
end
end