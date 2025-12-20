%% SCRIPT PROBLEMA 1
clear; clc; close all;

% --- CONFIGURACIÓN RUTAS INTELIGENTE ---
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));

% --- PARAMETRIZACIÓN ---
VERBOSE = true; % <--- Activar para ver trazas y explicaciones

fprintf('************************************************************\n');
fprintf('             RESOLUCIÓN PROBLEMA 1 (P1)\n');
fprintf('************************************************************\n');

% Definición del Problema
T = 2; y0 = 1;
syms y(t) t 
ode_sym = diff(y,t) == -y + 3*t^2 - 2*t + 1;
cond_sym = y(0) == 1;

% Funciones numéricas @(t,y)
f   = @(t,y) -y + 3*t.^2 - 2*t + 1;
fly = @(t,y) -1;          
flt = @(t,y) 6*t - 2;     

% --- EJECUCIÓN MODULAR ---
% 1. Analítico (General y Particular)
[sol_exacta, val_exacto] = gestor_analitico(ode_sym, cond_sym, T, VERBOSE);

% 2. Numérico (Euler, Heun, RK4, Taylor)
datos = gestor_numerico(f, fly, flt, y0, T, VERBOSE);

% 3. Errores y Análisis
gestor_errores(datos, val_exacto, VERBOSE);

% 4. Gráficos (Trazar los 4 métodos)
gestor_grafico(datos, sol_exacta, T, 'Problema 1', VERBOSE);

fprintf('\n>>> EJECUCIÓN FINALIZADA.\n');
