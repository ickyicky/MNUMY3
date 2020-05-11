q = [2 3 -6 4 7];

figure(1);
x = [-10 : 0.1 : 10];
plot(x, polyval(q, x));
hold on;
yline(0, 'k--');
hold off;
grid;


figure(2);
x = [-3 : 0.01 : 3];
plot(x, polyval(q, x));
hold on;
yline(0, 'k--');
xline(-0.8, 'c--');
xline(-2.8, 'c--');

maxiters = 10000;
accuracy = 0.0001;

[foundx, iters] = findx(q, accuracy, [-4.5, -5, 5, 10], maxiters);

scatter(foundx, polyval(q, foundx), 40, [0.2, 0.2, 0.8], 'filled');

hold off;
grid;

disp(foundx);
disp(iters);