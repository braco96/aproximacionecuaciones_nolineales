%% SCRIPT PROBLEMA 2
clear; clc; close all;
ruta = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta, '..', 'core'), fullfile(ruta, '..', 'lib'));

VERBOSE = true;
fprintf('=== PROBLEMA 2 ===\n');

% Definición
T=2; y0=0;
syms y(t) t; ode=diff(y,t)==2*y-sin(t)+1; cond=y(0)==0;
f=@(t,y) 2*y-sin(t)+1; fly=@(t,y) 2; flt=@(t,y) -cos(t);

% Ejecución
[sol, val] = gestor_analitico(ode, cond, T, VERBOSE);
dat = gestor_numerico(f, fly, flt, y0, T, VERBOSE);
gestor_errores(dat, val, VERBOSE);
gestor_grafico(dat, sol, T, 'Problema 2', VERBOSE);
