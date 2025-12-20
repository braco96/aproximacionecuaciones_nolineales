function [t,y] = rk2(y0, f, T, n)
    % Algoritmo de Heun (Runge-Kutta 2)
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        k1 = f(t(i), y(i));
        k2 = f(t(i)+h, y(i) + h*k1);
        y(i+1) = y(i) + (h/2) * (k1 + k2);
    end
end
