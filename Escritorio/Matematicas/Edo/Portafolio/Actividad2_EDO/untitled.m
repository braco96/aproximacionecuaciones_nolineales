% =========================================================================
%  ACTIVIDAD 2 - PORTAFOLIO (EDO)
%  SCRIPT PRINCIPAL DETALLADO CON GRÁFICAS
% =========================================================================
clear; clc; close all;

%% ========================================================================
%  PROBLEMA 1 (P1): y' = -y + 3t^2 - 2t + 1, con y(0) = 1
%  ========================================================================
fprintf('\n****************************************************************\n');
fprintf('                 INICIO DEL PROBLEMA 1 (P1)                     \n');
fprintf('****************************************************************\n');

% --- Configuración del Problema ---
T = 2;          
y0 = 1;         
f1 = @(y,t) -y + 3*t.^2 - 2*t + 1;
sol_exacta_p1 = @(t) 3*t.^2 - 8*t + 9 - 8*exp(-t); % Conocida para graficar

% Derivadas para Taylor Orden 2
fly1 = @(y,t) -1;            
flt1 = @(y,t) 6*t - 2;       

% -------------------------------------------------------------------------
% GRÁFICA PREVIA: CAMPO DE DIRECCIONES Y SOLUCIÓN
% -------------------------------------------------------------------------
fprintf('>>> Generando gráfica del Problema 1...\n');
figure('Name', 'Problema 1: Campo de Direcciones');
t_grid = linspace(0, 2, 20);
y_grid = linspace(0, 6, 20); % Rango ajustado a la solución (va de 1 a ~5.2)
[Tg, Yg] = meshgrid(t_grid, y_grid);

% Calculamos pendientes
dT = ones(size(Tg));
dY = -Yg + 3*Tg.^2 - 2*Tg + 1;
L = sqrt(dT.^2 + dY.^2); % Normalización para flechas uniformes

quiver(Tg, Yg, dT./L, dY./L, 0.5, 'b'); hold on; % Campo vectorial
fplot(sol_exacta_p1, [0, 2], 'r', 'LineWidth', 2); % Solución exacta
plot(0, 1, 'ko', 'MarkerFaceColor', 'k'); % Condición inicial

title('Problema 1: y'' = -y + 3t^2 - 2t + 1');
xlabel('t'); ylabel('y');
legend('Campo de Direcciones', 'Solución Exacta', 'Condición Inicial y(0)=1', 'Location', 'NorthWest');
grid on; hold off;
drawnow; % Forzar dibujado antes de seguir

% -------------------------------------------------------------------------
% APARTADO A: APLICACIÓN DE MÉTODOS NUMÉRICOS
% -------------------------------------------------------------------------
fprintf('\n>>> [APARTADO A] Aplicando métodos numéricos...\n');
fprintf('    Objetivo: Obtener el valor aproximado y(2) para distintos pasos n.\n\n');
fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'Pasos', 'Euler', 'Heun', 'RK4', 'Taylor2');
fprintf('----------------------------------------------------------------------\n');

valores_aprox_P1 = []; 

for j = 0:6
    n = 10 * 2^j; 
    
    [~, ye] = eulerexp(y0, f1, T, n);
    [~, yh] = rk2(y0, f1, T, n);
    [~, yr] = rk4(y0, f1, T, n);
    [~, yt] = taylor2(y0, f1, fly1, flt1, T, n);
    
    val_e = ye(end); val_h = yh(end); val_r = yr(end); val_t = yt(end);
    valores_aprox_P1 = [valores_aprox_P1; n, val_e, val_h, val_r, val_t];
    
    fprintf('%-6d | %-12.5f %-12.5f %-12.5f %-12.5f\n', n, val_e, val_h, val_r, val_t);
end
fprintf('\n(Nota: Estos son los valores aproximados de y(2). Se observa convergencia).\n');

% -------------------------------------------------------------------------
% APARTADO B: SOLUCIÓN ANALÍTICA
% -------------------------------------------------------------------------
fprintf('\n\n>>> [APARTADO B] Calculando Solución Analítica...\n');
syms y(t) t
eqn1 = diff(y) == -y + 3*t^2 - 2*t + 1;
cond1 = y(0) == 1;
sol1_sym = dsolve(eqn1, cond1);

fprintf('    La ecuación es lineal de primer orden. Usando factor integrante e^t:\n');
fprintf('    Fórmula Exacta: y(t) = %s\n', char(sol1_sym));

psol1 = matlabFunction(sol1_sym);
exacta_P1 = psol1(T);
fprintf('    Valor EXACTO en t=2: %.8f\n', exacta_P1);

% -------------------------------------------------------------------------
% APARTADO C: TABLA DE ERRORES
% -------------------------------------------------------------------------
fprintf('\n\n>>> [APARTADO C] Generando Tabla de Errores Absolutos...\n');
fprintf('    Cálculo: | Valor_Aproximado (del apartado A) - Valor_Exacto (del apartado B) |\n\n');
fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'Pasos', 'Err_Euler', 'Err_Heun', 'Err_RK4', 'Err_Tay2');
fprintf('----------------------------------------------------------------------\n');

errores_P1 = [];

for i = 1:size(valores_aprox_P1, 1)
    n = valores_aprox_P1(i, 1);
    vals = valores_aprox_P1(i, 2:5); 
    errs = abs(vals - exacta_P1);
    errores_P1 = [errores_P1; errs];
    
    fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', n, errs(1), errs(2), errs(3), errs(4));
end

% -------------------------------------------------------------------------
% APARTADO D: ANÁLISIS DE RESULTADOS
% -------------------------------------------------------------------------
fprintf('\n\n>>> [APARTADO D] Análisis de Convergencia (EOC)...\n');
fprintf('    Se estima el orden "p" usando la fórmula: log2(Error_anterior / Error_actual)\n');
fprintf('    Esperamos: Euler=1, Heun=2, RK4=4, Taylor2=2\n\n');

e_ant = errores_P1(end-1, :);
e_act = errores_P1(end, :);
ordenes = log2(e_ant ./ e_act);

fprintf('    Orden Euler:    %.2f  (Coherente con teoría p=1)\n', ordenes(1));
fprintf('    Orden Heun:     %.2f  (Coherente con teoría p=2)\n', ordenes(2));
fprintf('    Orden RK4:      %.2f  (Coherente con teoría p=4)\n', ordenes(3));
fprintf('    Orden Taylor2:  %.2f  (Coherente con teoría p=2)\n', ordenes(4));

fprintf('\n----------------------------------------------------------------\n');
fprintf('Pulse una tecla para continuar con el PROBLEMA 2...\n');
pause; 


%% ========================================================================
%  PROBLEMA 2 (P2): y' = 2y - sin(t) + 1, con y(0) = 0
%  ========================================================================
clc;
fprintf('\n****************************************************************\n');
fprintf('                 INICIO DEL PROBLEMA 2 (P2)                     \n');
fprintf('****************************************************************\n');

T = 2; 
y0 = 0;
f2 = @(y,t) 2*y - sin(t) + 1;
sol_exacta_p2 = @(t) 0.3*exp(2*t) + 0.4*sin(t) + 0.2*cos(t) - 0.5;

% Derivadas para Taylor
fly2 = @(y,t) 2;             
flt2 = @(y,t) -cos(t);       

% -------------------------------------------------------------------------
% GRÁFICA PREVIA: CAMPO DE DIRECCIONES Y SOLUCIÓN
% -------------------------------------------------------------------------
fprintf('>>> Generando gráfica del Problema 2...\n');
figure('Name', 'Problema 2: Campo de Direcciones');
t_grid = linspace(0, 2, 20);
y_grid = linspace(0, 18, 20); % Rango ajustado (solución crece exponencialmente hasta ~16.3)
[Tg, Yg] = meshgrid(t_grid, y_grid);

dT = ones(size(Tg));
dY = 2*Yg - sin(Tg) + 1;
L = sqrt(dT.^2 + dY.^2);

quiver(Tg, Yg, dT./L, dY./L, 0.5, 'b'); hold on;
fplot(sol_exacta_p2, [0, 2], 'r', 'LineWidth', 2);
plot(0, 0, 'ko', 'MarkerFaceColor', 'k');

title('Problema 2: y'' = 2y - sin(t) + 1');
xlabel('t'); ylabel('y');
legend('Campo de Direcciones', 'Solución Exacta', 'Condición Inicial y(0)=0', 'Location', 'NorthWest');
grid on; hold off;
drawnow;

% --- APARTADO A ---
fprintf('\n>>> [APARTADO A] Aplicando métodos numéricos...\n');
fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'Pasos', 'Euler', 'Heun', 'RK4', 'Taylor2');
fprintf('----------------------------------------------------------------------\n');

valores_aprox_P2 = [];

for j = 0:6
    n = 10 * 2^j; 
    [~, ye] = eulerexp(y0, f2, T, n);
    [~, yh] = rk2(y0, f2, T, n);
    [~, yr] = rk4(y0, f2, T, n);
    [~, yt] = taylor2(y0, f2, fly2, flt2, T, n);
    
    val_e = ye(end); val_h = yh(end); val_r = yr(end); val_t = yt(end);
    valores_aprox_P2 = [valores_aprox_P2; n, val_e, val_h, val_r, val_t];
    
    fprintf('%-6d | %-12.5f %-12.5f %-12.5f %-12.5f\n', n, val_e, val_h, val_r, val_t);
end

% --- APARTADO B ---
fprintf('\n\n>>> [APARTADO B] Calculando Solución Analítica...\n');
syms y(t) t
eqn2 = diff(y) == 2*y - sin(t) + 1;
cond2 = y(0) == 0;
sol2_sym = dsolve(eqn2, cond2);

fprintf('    Fórmula Exacta: y(t) = %s\n', char(sol2_sym));
psol2 = matlabFunction(sol2_sym);
exacta_P2 = psol2(T);
fprintf('    Valor EXACTO en t=2: %.8f\n', exacta_P2);

% --- APARTADO C ---
fprintf('\n\n>>> [APARTADO C] Generando Tabla de Errores Absolutos...\n');
fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'Pasos', 'Err_Euler', 'Err_Heun', 'Err_RK4', 'Err_Tay2');
fprintf('----------------------------------------------------------------------\n');

errores_P2 = [];
for i = 1:size(valores_aprox_P2, 1)
    n = valores_aprox_P2(i, 1);
    vals = valores_aprox_P2(i, 2:5);
    errs = abs(vals - exacta_P2);
    errores_P2 = [errores_P2; errs];
    fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', n, errs(1), errs(2), errs(3), errs(4));
end

% --- APARTADO D ---
fprintf('\n\n>>> [APARTADO D] Análisis de Convergencia (EOC)...\n');
e_ant = errores_P2(end-1, :);
e_act = errores_P2(end, :);
ordenes = log2(e_ant ./ e_act);

fprintf('    Orden Euler:    %.2f\n', ordenes(1));
fprintf('    Orden Heun:     %.2f\n', ordenes(2));
fprintf('    Orden RK4:      %.2f\n', ordenes(3));
fprintf('    Orden Taylor2:  %.2f\n', ordenes(4));
fprintf('\n*** FIN DE LA EJECUCIÓN ***\n');



