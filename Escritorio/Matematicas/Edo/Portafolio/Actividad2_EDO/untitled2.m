% =========================================================================
%  SCRIPT SOLO PARA GRAFICAR CAMPO DE DIRECCIONES (P1 y P2)
% =========================================================================
clear; clc; close all;

%% --- PROBLEMA 1 ---
% Ecuación: y' = -y + 3t^2 - 2t + 1
% Solución Exacta: y(t) = 3t^2 - 8t + 9 - 8e^(-t)

fprintf('Generando gráfica del Problema 1...\n');
figure('Name', 'Problema 1: Campo de Direcciones');

% 1. Definir la malla (grid)
t = 0:0.01:2;       % Rango de t [0, 2] con paso 0.2 para mejor visualización
y = 0:0.01:6;       % Rango de y (ajustado a la solución que va de 1 a ~5.2)
[T, Y] = meshgrid(t, y);

% 2. Definir la Ecuación Diferencial (Pendientes)
% dy/dt = f(t,y) -> Vector tangente es (1, f(t,y))
dT = ones(size(T));             
dY = -Y + 3*T.^2 - 2*T + 1;     

% 3. Normalizar vectores (para que las flechas tengan igual longitud)
L = sqrt(dT.^2 + dY.^2);
dT = dT ./ L;
dY = dY ./ L;

% 4. Graficar Campo Vectorial (Flechas azules)
quiver(T, Y, dT, dY); 
hold on;

% 5. Graficar Solución Exacta (Curva roja)
t_sol = 0:0.01:2;
y_sol = 3*t_sol.^2 - 8*t_sol + 9 - 8*exp(-t_sol);
plot(t_sol, y_sol, 'r', 'LineWidth', 2);

% 6. Configuración visual
plot(0, 1, 'ko', 'MarkerFaceColor', 'k'); % Punto inicial y(0)=1
title('Problema 1: y'' = -y + 3t^2 - 2t + 1');
xlabel('t'); ylabel('y');
legend('Campo de Direcciones', 'Solución Exacta', 'y(0)=1', 'Location', 'NorthWest');

% Ajuste de ejes: [t_min t_max y_min y_max]
axis([0 2 0 6]); 
grid on; hold off;


%% --- PROBLEMA 2 ---
% Ecuación: y' = 2y - sin(t) + 1
% Solución Exacta: y(t) = 0.3e^(2t) + 0.4sin(t) + 0.2cos(t) - 0.5

fprintf('Generando gráfica del Problema 2...\n');
figure('Name', 'Problema 2: Campo de Direcciones');

% 1. Definir la malla (Rango Y más amplio porque crece exponencialmente)
t = 0:0.1:2;
y = 0:0.1:18;        % La solución llega hasta ~16.3
[T, Y] = meshgrid(t, y);

% 2. Definir la Ecuación Diferencial
dT = ones(size(T));
dY = 2*Y - sin(T) + 1;

% 3. Normalizar
L = sqrt(dT.^2 + dY.^2);
dT = dT ./ L;
dY = dY ./ L;

% 4. Graficar Campo Vectorial
quiver(T, Y, dT, dY); 
hold on;

% 5. Graficar Solución Exacta
t_sol = 0:0.01:2;
y_sol = 0.3*exp(2*t_sol) + 0.4*sin(t_sol) + 0.2*cos(t_sol) - 0.5;
plot(t_sol, y_sol, 'r', 'LineWidth', 2);

% 6. Configuración visual
plot(0, 0, 'ko', 'MarkerFaceColor', 'k'); % Punto inicial y(0)=0
title('Problema 2: y'' = 2y - sin(t) + 1');
xlabel('t'); ylabel('y');
legend('Campo de Direcciones', 'Solución Exacta', 'y(0)=0', 'Location', 'NorthWest');

% Ajuste de ejes
axis([0 2 0 18]);
grid on; hold off;