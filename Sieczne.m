function xn = Sieczne(f, xn1, xn, accuracy)

while abs(f(xn)) > accuracy
    xnn = (xn1 * f(xn) - xn * f(xn1)) / (f(xn) - f(xn1));
    xn1 = xn;
    xn = xnn;
end
end