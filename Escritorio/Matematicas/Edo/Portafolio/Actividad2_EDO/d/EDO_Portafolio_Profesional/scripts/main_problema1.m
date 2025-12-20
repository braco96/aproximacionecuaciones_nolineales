%% SCRIPT PROBLEMA 1
clear; clc; close all;

% --- CONFIGURACIÓN RUTAS ---
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));

% --- PARAMETRIZACIÓN ---
VERBOSE = true; % <--- CAMBIAR AQUI PARA MOSTRAR/OCULTAR EXPLICACIONES

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

if VERBOSE
    fprintf('Función definida: f(t,y) = -y + 3t^2 - 2t + 1\n');
    fprintf('Condición Inicial: y(0) = 1\n');
end

% --- EJECUCIÓN MODULAR ---
% 1. Analítico
[sol_exacta, val_exacto] = gestor_analitico(ode_sym, cond_sym, T, VERBOSE);

% 2. Numérico
datos = gestor_numerico(f, fly, flt, y0, T, VERBOSE);

% 3. Errores y Análisis
gestor_errores(datos, val_exacto, VERBOSE);

% 4. Gráficos
gestor_grafico(datos, sol_exacta, T, 'Problema 1', VERBOSE);

fprintf('\n>>> EJECUCIÓN FINALIZADA.\n');
