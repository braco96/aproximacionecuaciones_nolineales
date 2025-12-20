%% SCRIPT PROBLEMA 3 - ESTUDIO DE CONVERGENCIA
% Este script analiza AMBOS problemas para visualizar el orden de convergencia.
clear; clc; close all;
ruta = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta, '..', 'core'), fullfile(ruta, '..', 'lib'));

VERBOSE = true;
fprintf('======================================================\n');
fprintf('       PROBLEMA 3: ESTUDIO DE CONVERGENCIA\n');
fprintf('======================================================\n');

% --- ANÁLISIS PROBLEMA 1 ---
fprintf('\n>>> Analizando Problema 1...\n');
T=2; y0=1;
syms y(t) t; ode=diff(y,t)==-y+3*t^2-2*t+1; cond=y(0)==1;
f=@(t,y) -y+3*t.^2-2*t+1; fly=@(t,y) -1; flt=@(t,y) 6*t-2;

% Obtenemos solución exacta (silencioso)
sol1_func = matlabFunction(dsolve(ode, cond));
% Lanzamos investigación visual
gestor_investigacion(f, fly, flt, y0, T, sol1_func, 'Problema 1 (y'' = -y...)', VERBOSE);

% --- ANÁLISIS PROBLEMA 2 ---
fprintf('\n>>> Analizando Problema 2...\n');
T=2; y0=0;
syms y(t) t; ode=diff(y,t)==2*y-sin(t)+1; cond=y(0)==0;
f=@(t,y) 2*y-sin(t)+1; fly=@(t,y) 2; flt=@(t,y) -cos(t);

sol2_func = matlabFunction(dsolve(ode, cond));
gestor_investigacion(f, fly, flt, y0, T, sol2_func, 'Problema 2 (y'' = 2y...)', VERBOSE);

fprintf('\n=== ESTUDIO COMPLETADO ===\n');
fprintf('Se han generado 2 gráficas Log-Log mostrando las pendientes de error.\n');
