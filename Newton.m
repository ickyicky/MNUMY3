function x = Newton(f, df, a, b, accuracy)

x = a - f(a) / df(a);
while abs(f(x)) >= accuracy && x < b && x > a
    x = x - f(x) / df(x);
end
end