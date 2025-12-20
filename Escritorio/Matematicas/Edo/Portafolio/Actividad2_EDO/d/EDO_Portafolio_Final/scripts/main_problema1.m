%% SCRIPT PROBLEMA 1
clear; clc; close all;

% --- ARREGLO DE RUTAS "INTELIGENTE" ---
% Encuentra dónde está este archivo y busca core/ y lib/ relativas a él
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));
% --------------------------------------

fprintf('========================================\n');
fprintf('       EJECUCIÓN: PROBLEMA 1\n');
fprintf('========================================\n');

T = 2; y0 = 1;

% Definición simbólica
syms y(t) t
ode_sym = diff(y,t) == -y + 3*t^2 - 2*t + 1;
cond_sym = y(0) == 1;

% Definición numérica @(t,y)
f   = @(t,y) -y + 3*t.^2 - 2*t + 1;
fly = @(t,y) -1;
flt = @(t,y) 6*t - 2;

% Pipeline de ejecución
[sol_exacta, val_exacto] = gestor_analitico(ode_sym, cond_sym, T);
datos = gestor_numerico(f, fly, flt, y0, T);
gestor_errores(datos, val_exacto);
gestor_grafico(datos, sol_exacta, T, 'Problema 1');
