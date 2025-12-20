%% SCRIPT PROBLEMA 2
clear; clc; close all;

% --- CONFIGURACIÓN RUTAS INTELIGENTE ---
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));

% --- PARAMETRIZACIÓN ---
VERBOSE = true; 

fprintf('************************************************************\n');
fprintf('             RESOLUCIÓN PROBLEMA 2 (P2)\n');
fprintf('************************************************************\n');

% Definición del Problema
T = 2; y0 = 0;
syms y(t) t
ode_sym = diff(y,t) == 2*y - sin(t) + 1;
cond_sym = y(0) == 0;

% Funciones numéricas @(t,y)
f   = @(t,y) 2*y - sin(t) + 1;
fly = @(t,y) 2;           
flt = @(t,y) -cos(t);     

% --- EJECUCIÓN MODULAR ---
[sol_exacta, val_exacto] = gestor_analitico(ode_sym, cond_sym, T, VERBOSE);
datos = gestor_numerico(f, fly, flt, y0, T, VERBOSE);
gestor_errores(datos, val_exacto, VERBOSE);
gestor_grafico(datos, sol_exacta, T, 'Problema 2', VERBOSE);

fprintf('\n>>> EJECUCIÓN FINALIZADA.\n');
