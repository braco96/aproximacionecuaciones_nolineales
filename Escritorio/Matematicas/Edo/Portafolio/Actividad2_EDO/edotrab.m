clear; clc; close all;
syms y(t) t

%% ========================================================================
%  PARTE 1: CÁLCULO SIMBÓLICO (Obtener las fórmulas)
% ========================================================================

% --- PROBLEMA 1 ---
% Ecuación: y' = -y + 3t^2 - 2t + 1, y(0) = 1
ode1 = diff(y,t) == -y + 3*t^2 - 2*t + 1;
cond1 = y(0) == 1;
sol1 = dsolve(ode1, cond1);

% Convertimos a función numérica para poder graficarla después
psol1 = matlabFunction(sol1); 

% Salida de texto solicitada
fprintf('para la ecuacion y'' = -y + 3t^2 - 2t + 1 su solucion sera :\n');
disp(sol1);


% --- PROBLEMA 2 ---
% Ecuación: y' = 2y - sin(t) + 1, y(0) = 0
ode2 = diff(y,t) == 2*y - sin(t) + 1;
cond2 = y(0) == 0;
sol2 = dsolve(ode2, cond2);

% Convertimos a función numérica
psol2 = matlabFunction(sol2);

% Salida de texto solicitada
fprintf('\npara la ecuacion y'' = 2y - sin(t) + 1 su solucion sera :\n');
disp(sol2);


%% ========================================================================
%  PARTE 2: GRAFICACIÓN (Usando las soluciones calculadas arriba)
% ========================================================================

fprintf('\nGenerando gráficas combinadas...\n');

%% --- GRÁFICA PROBLEMA 1 ---
figure('Name', 'Problema 1: Campo vs Solución Calculada');
hold on;

% 1. Campo de Direcciones (Quiver) - Usamos paso GRANDE (0.2) para que se vean las flechas
t_quiver = 0 : 0.2 : 2;      
y_quiver = 0 : 0.2 : 6;      
[T, Y] = meshgrid(t_quiver, y_quiver);

dT = ones(size(T));             
dY = -Y + 3*T.^2 - 2*T + 1;     

% Normalización
L = sqrt(dT.^2 + dY.^2);
quiver(T, Y, dT./L, dY./L, 0.5, 'b'); % Flechas azules

% 2. Solución Exacta (Curva Roja) - Usamos paso FINO (0.01) y la función psol1
t_plot = 0 : 0.01 : 2;
y_plot = psol1(t_plot); % <--- ¡AQUÍ USAMOS LA SOLUCIÓN CALCULADA!

plot(t_plot, y_plot, 'r', 'LineWidth', 2);

% 3. Decoración
plot(0, 1, 'ko', 'MarkerFaceColor', 'k'); % Punto inicial
title('Problema 1: y'' = -y + 3t^2 - 2t + 1');
xlabel('t'); ylabel('y');
legend('Campo de Direcciones', 'Solución Exacta (dsolve)', 'y(0)=1', 'Location', 'best');
axis([0 2 0 6]); grid on;


%% --- GRÁFICA PROBLEMA 2 ---
figure('Name', 'Problema 2: Campo vs Solución Calculada');
hold on;

% 1. Campo de Direcciones
t_quiver = 0 : 0.1 : 2;
y_quiver = 0 : 0.5 : 18;  % Rango amplio
[T, Y] = meshgrid(t_quiver, y_quiver);

dT = ones(size(T));
dY = 2*Y - sin(T) + 1;

% Normalización
L = sqrt(dT.^2 + dY.^2);
quiver(T, Y, dT./L, dY./L, 0.5, 'b');

% 2. Solución Exacta - Usamos psol2 calculada automáticamente
t_plot = 0 : 0.01 : 2;
y_plot = psol2(t_plot); % <--- ¡AQUÍ USAMOS LA SOLUCIÓN CALCULADA!

plot(t_plot, y_plot, 'r', 'LineWidth', 2);

% 3. Decoración
plot(0, 0, 'ko', 'MarkerFaceColor', 'k'); % Punto inicial
title('Problema 2: y'' = 2y - sin(t) + 1');
xlabel('t'); ylabel('y');
legend('Campo de Direcciones', 'Solución Exacta (dsolve)', 'y(0)=0', 'Location', 'best');
axis([0 2 0 18]); grid on;