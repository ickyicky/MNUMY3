function x = MM2(q, accuracy, x)
% MM2 znajduje wszystkie pierwiastki
% wielomianu o współczynnikach a.
% Kolejne wspolczynniki pochodnych wieloianu
% są obliczane dla wzoru na pochodną wielomianu.


y = polyval(q, x);
while abs(y) > accuracy
    df = q(1 : length(q) - 1);
    for i = 1 : length(df)
        df(i) = (length(df) + 1 - i) * df(i);
    end
    
    ddf = df(1 : length(df) -1);
    for i = 1 : length(ddf)
        ddf(i) = (length(ddf) + 1 - i) * ddf(i);
    end

    d = sqrt(polyval(df, x) ^ 2 - 2 * polyval(q, x) * polyval(ddf, x));
    
    if abs(polyval(q, x) - d) >= abs(polyval(q, x) + d)
        z = -2 * polyval(q, x) / (polyval(df, x) + d);
    else
        z = -2 * polyval(q, x) / (polyval(df, x) - d);
    end
    
    x = x + z;
    y = polyval(q, x);
end
end