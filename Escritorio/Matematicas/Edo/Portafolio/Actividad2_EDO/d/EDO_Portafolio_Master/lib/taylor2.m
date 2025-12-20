function [t,y] = taylor2(y0, f, fy, ft, T, n)
    % Motor Taylor Orden 2
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        d1 = f(t(i), y(i));
        d2 = ft(t(i), y(i)) + d1 * fy(t(i), y(i));
        y(i+1) = y(i) + h*d1 + 0.5*h^2*d2;
    end
end
