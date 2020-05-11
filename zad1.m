% wykres, na podstawie którego szacowane sa przedziały dla
% wsystkich zer funkcji.

figure(1);
x = [0: 0.01: 14];
plot(x, arrayfun(@fun, x));
hold on;
yline(0, 'k--');
xline(2, 'c--', 'LineWidth', 2);
xline(8, 'c--', 'LineWidth', 2);
xline(12, 'c--', 'LineWidth', 2);

maxiters = 1000;
accuracy = 0.00001;
przedzialy = [[2, 8];[8, 12]];

% Metoda False Positions
foundx = [0, 0];
iters = [0, 0];

for i = 1 : length(przedzialy)
    p = przedzialy(:,i);
    [foundx(i), iters(i)] = FalsePosition(@fun, p(1), p(2), accuracy, maxiters);
end

values = arrayfun(@fun, foundx);
data1 = [foundx', values', iters'];
scatter(foundx, values, 120, [0.2, 0.8, 0.2], 'filled');

% Metoda Siecznych
foundx = [0, 0];
iters = [0, 0];

for i = 1 : length(przedzialy)
    p = przedzialy(:,i);
    [foundx(i), iters(i)] = Sieczne(@fun, p(1), p(2), accuracy, maxiters);
end

values = arrayfun(@fun, foundx);
data2 = [foundx', values', iters'];
scatter(foundx, values, 80, [0.8, 0.2, 0.2], 'filled');

% Metoda Newtona
foundx = [0, 0];
iters = [0, 0];
% korekta przedziałów, bez tego metoda nie jest bieżna
przedzialy = [[4, 8];[8, 12]];

for i = 1 : length(przedzialy)
    p = przedzialy(:,i);
    [foundx(i), iters(i)] = Newton(@fun, @dfun, p(1), p(2), accuracy, maxiters);
end

values = arrayfun(@fun, foundx);
data3 = [foundx', values', iters'];
scatter(foundx, values, 40, [0.2, 0.2, 0.8], 'filled');

hold off;
grid;

headers = {'pierwiastki', 'wartość funkcji', 'liczba iteracji'};

f = figure(2);
uitable(f, 'data', data1, 'columnname', headers);
f = figure(3);
uitable(f, 'data', data2, 'columnname', headers);
f = figure(4);
uitable(f, 'data', data3, 'columnname', headers);