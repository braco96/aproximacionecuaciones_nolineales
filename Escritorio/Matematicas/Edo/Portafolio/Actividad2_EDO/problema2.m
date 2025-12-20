% RESOLUCIÓN DEL PROBLEMA 2 (P2)
clear; clc;

% --- Solución Analítica ---
% y(t) = 0.3e^2t + 0.4sin(t) + 0.2cos(t) - 0.5
psol = @(t) 0.3*exp(2*t) + 0.4*sin(t) + 0.2*cos(t) - 0.5;

% --- Parámetros ---
T = 2;
y0 = 0;
f = @(y,t) 2*y - sin(t) + 1;

% Derivadas para Taylor (f = 2y - sin(t) + 1)
fly = @(y,t) 2;             % df/dy
flt = @(y,t) -cos(t);       % df/dt

fprintf('=== TABLA DE ERRORES P2 (t=2) ===\n');
fprintf('%-6s %-12s %-12s %-12s %-12s\n', 'Pasos', 'Err Euler', 'Err Heun', 'Err RK4', 'Err Taylor2');
fprintf('------------------------------------------------------------\n');

for j = 0:6
    n = 10 * 2^j; 
    
    [t, y_eu] = eulerexp(y0, f, T, n);
    [t, y_he] = rk2(y0, f, T, n);
    [t, y_r4] = rk4(y0, f, T, n);
    [t, y_ta] = taylor2(y0, f, fly, flt, T, n);
    
    exacta = psol(T);
    
    e_eu = abs(y_eu(end) - exacta);
    e_he = abs(y_he(end) - exacta);
    e_r4 = abs(y_r4(end) - exacta);
    e_ta = abs(y_ta(end) - exacta);
    
    fprintf('%-6d %-12.2e %-12.2e %-12.2e %-12.2e\n', n, e_eu, e_he, e_r4, e_ta);
end
