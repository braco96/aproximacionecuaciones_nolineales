%% EJECUCIÓN DEL PROBLEMA 1
%  y' = -y + 3t^2 - 2t + 1, y(0)=1
% -------------------------------------------------------------------------
clear; clc; close all;

% --- CONFIGURACIÓN DE RUTAS AUTOMÁTICA ---
% Esto evita el error "nonexistent directory". Busca las carpetas relativas al script.
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));
% -----------------------------------------

fprintf('============================================================\n');
fprintf('       INICIANDO RESOLUCIÓN: PROBLEMA 1\n');
fprintf('============================================================\n');

% DATOS DEL PROBLEMA
T = 2; 
y0 = 1;

% Definición Simbólica (Para el Gestor Analítico)
syms y(t) t 
ode_sym = diff(y,t) == -y + 3*t^2 - 2*t + 1;
cond_sym = y(0) == 1;

% Definición Numérica (Para el Gestor Numérico)
% NOTA: El orden es estrictamente @(t,y) para compatibilidad con solvers
f   = @(t,y) -y + 3*t.^2 - 2*t + 1;
fly = @(t,y) -1;          % df/dy
flt = @(t,y) 6*t - 2;     % df/dt

% --- PIPELINE DE EJECUCIÓN ---
% 1. Obtener solución analítica (General y Particular)
[sol_exacta_func, val_exacto] = gestor_analitico(ode_sym, cond_sym, T);

% 2. Ejecutar métodos numéricos
datos = gestor_numerico(f, fly, flt, y0, T);

% 3. Calcular errores y órdenes
gestor_errores(datos, val_exacto);

% 4. Generar gráficas
gestor_grafico(datos, sol_exacta_func, T, 'Problema 1');

fprintf('\n=== EJECUCIÓN COMPLETADA EXITOSAMENTE ===\n');
