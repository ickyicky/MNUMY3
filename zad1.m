przedzialy = [[2, 8];[8, 12]];

for p = przedzialy
    x = FalsePosition(@fun, p(1), p(2), 0.001);
    disp(x);
    x = Sieczne(@fun, p(1), p(2), 0.001);
    disp(x);
    x = Newton(@fun, @dfun, p(1), p(2), 0.001);
    disp(x);
end