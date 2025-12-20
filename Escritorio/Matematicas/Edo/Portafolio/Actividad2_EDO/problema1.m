% RESOLUCIÓN DEL PROBLEMA 1 (P1)
clear; clc;

% --- Solución Analítica ---
% y(t) = 3t^2 - 8t + 9 - 8e^-t
psol = @(t) 3*t.^2 - 8*t + 9 - 8*exp(-t);

% --- Parámetros ---
T = 2;
y0 = 1;
f = @(y,t) -y + 3*t.^2 - 2*t + 1;

% Derivadas para Taylor (f = -y + 3t^2 - 2t + 1)
fly = @(y,t) -1;            % df/dy
flt = @(y,t) 6*t - 2;       % df/dt

fprintf('=== TABLA DE ERRORES P1 (t=2) ===\n');
fprintf('%-6s %-12s %-12s %-12s %-12s\n', 'Pasos', 'Err Euler', 'Err Heun', 'Err RK4', 'Err Taylor2');
fprintf('------------------------------------------------------------\n');

for j = 0:6
    n = 10 * 2^j; % n = 10, 20, 40, ...
    
    [t, y_eu] = eulerexp(y0, f, T, n);
    [t, y_he] = rk2(y0, f, T, n);
    [t, y_r4] = rk4(y0, f, T, n);
    [t, y_ta] = taylor2(y0, f, fly, flt, T, n);
    
    exacta = psol(T);
    
    % Errores absolutos en el punto final
    e_eu = abs(y_eu(end) - exacta);
    e_he = abs(y_he(end) - exacta);
    e_r4 = abs(y_r4(end) - exacta);
    e_ta = abs(y_ta(end) - exacta);
    
    fprintf('%-6d %-12.2e %-12.2e %-12.2e %-12.2e\n', n, e_eu, e_he, e_r4, e_ta);
end
