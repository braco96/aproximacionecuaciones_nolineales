function [t,y] = eulerexp(y0, f, T, n)
    % Motor Euler Explícito
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        y(i+1) = y(i) + h * f(t(i), y(i));
    end
end
