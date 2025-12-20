%% SCRIPT PROBLEMA 2
clear; clc; close all;

% --- ARREGLO DE RUTAS "INTELIGENTE" ---
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));
% --------------------------------------

fprintf('========================================\n');
fprintf('       EJECUCIÓN: PROBLEMA 2\n');
fprintf('========================================\n');

T = 2; y0 = 0;

% Simbólico
syms y(t) t
ode_sym = diff(y,t) == 2*y - sin(t) + 1;
cond_sym = y(0) == 0;

% Numérico @(t,y)
f   = @(t,y) 2*y - sin(t) + 1;
fly = @(t,y) 2;
flt = @(t,y) -cos(t);

% Pipeline
[sol_exacta, val_exacto] = gestor_analitico(ode_sym, cond_sym, T);
datos = gestor_numerico(f, fly, flt, y0, T);
gestor_errores(datos, val_exacto);
gestor_grafico(datos, sol_exacta, T, 'Problema 2');
