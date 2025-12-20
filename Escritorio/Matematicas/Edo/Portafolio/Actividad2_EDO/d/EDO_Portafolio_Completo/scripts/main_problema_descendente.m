%% SCRIPT: EJECUCIÓN DESCENDENTE (5 FORMAS)
%  Este script resuelve los Problemas 1 y 2 ejecutando los algoritmos
%  desde n=640 hasta n=40 (5 iteraciones), mostrando definiciones y pasos.
% -------------------------------------------------------------------------
clear; clc; close all;

% Configuración de rutas
ruta_script = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta_script, '..', 'core'));
addpath(fullfile(ruta_script, '..', 'lib'));

fprintf('############################################################\n');
fprintf('       PROBLEMA K (SOLICITUD ESPECIAL DESCENDENTE)\n');
fprintf('############################################################\n');

%% --- PROBLEMA 1 ---
fprintf('\n>>> PROCESANDO PROBLEMA 1 (y'' = -y + ...)\n');
T = 2; y0 = 1;
syms y(t) t 
ode_sym = diff(y,t) == -y + 3*t^2 - 2*t + 1;
cond_sym = y(0) == 1;

f   = @(t,y) -y + 3*t.^2 - 2*t + 1;
fly = @(t,y) -1;          
flt = @(t,y) 6*t - 2;     

% 1. Analítica (para tener referencia visual)
[sol_exacta, ~] = gestor_analitico(ode_sym, cond_sym, T, false); 

% 2. Numérica DESCENDENTE (Lo que pediste)
datos1 = gestor_numerico_descendente(f, fly, flt, y0, T);

% 3. Gráfica (usando la traza de alta resolución guardada)
gestor_grafico(datos1, sol_exacta, T, 'Problema 1 (Descendente)', true);


%% --- PROBLEMA 2 ---
fprintf('\n\n>>> PROCESANDO PROBLEMA 2 (y'' = 2y - ...)\n');
T = 2; y0 = 0;
syms y(t) t
ode_sym = diff(y,t) == 2*y - sin(t) + 1;
cond_sym = y(0) == 0;

f   = @(t,y) 2*y - sin(t) + 1;
fly = @(t,y) 2;           
flt = @(t,y) -cos(t);     

% 1. Analítica
[sol_exacta2, ~] = gestor_analitico(ode_sym, cond_sym, T, false);

% 2. Numérica DESCENDENTE
datos2 = gestor_numerico_descendente(f, fly, flt, y0, T);

% 3. Gráfica
gestor_grafico(datos2, sol_exacta2, T, 'Problema 2 (Descendente)', true);

fprintf('\n=== EJECUCIÓN FINALIZADA ===\n');
