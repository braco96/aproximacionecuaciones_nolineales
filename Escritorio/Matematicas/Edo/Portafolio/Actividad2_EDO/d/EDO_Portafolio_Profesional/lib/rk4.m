function [t,y] = rk4(y0, f, T, n)
    % Motor Runge-Kutta 4
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        k1 = f(t(i), y(i));
        k2 = f(t(i)+0.5*h, y(i) + 0.5*h*k1);
        k3 = f(t(i)+0.5*h, y(i) + 0.5*h*k2);
        k4 = f(t(i)+h, y(i) + h*k3);
        y(i+1) = y(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end
