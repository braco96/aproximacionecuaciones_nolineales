%% EJECUCIÓN DEL PROBLEMA 2
%  y' = 2y - sin(t) + 1, y(0)=0
% -------------------------------------------------------------------------
clear; clc; close all;

% --- CONFIGURACIÓN DE RUTAS AUTOMÁTICA ---
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));
% -----------------------------------------

fprintf('============================================================\n');
fprintf('       INICIANDO RESOLUCIÓN: PROBLEMA 2\n');
fprintf('============================================================\n');

% DATOS DEL PROBLEMA
T = 2; 
y0 = 0;

% Definición Simbólica
syms y(t) t
ode_sym = diff(y,t) == 2*y - sin(t) + 1;
cond_sym = y(0) == 0;

% Definición Numérica @(t,y)
f   = @(t,y) 2*y - sin(t) + 1;
fly = @(t,y) 2;           % df/dy
flt = @(t,y) -cos(t);     % df/dt

% --- PIPELINE DE EJECUCIÓN ---
[sol_exacta_func, val_exacto] = gestor_analitico(ode_sym, cond_sym, T);
datos = gestor_numerico(f, fly, flt, y0, T);
gestor_errores(datos, val_exacto);
gestor_grafico(datos, sol_exacta_func, T, 'Problema 2');

fprintf('\n=== EJECUCIÓN COMPLETADA EXITOSAMENTE ===\n');
