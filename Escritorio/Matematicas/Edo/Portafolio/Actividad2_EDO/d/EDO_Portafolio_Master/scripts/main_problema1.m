%% SCRIPT PROBLEMA 1
clear; clc; close all;
ruta = fileparts(mfilename('fullpath'));
addpath(fullfile(ruta, '..', 'core'), fullfile(ruta, '..', 'lib'));

VERBOSE = true;
fprintf('=== PROBLEMA 1 ===\n');

% Definición
T=2; y0=1;
syms y(t) t; ode=diff(y,t)==-y+3*t^2-2*t+1; cond=y(0)==1;
f=@(t,y) -y+3*t.^2-2*t+1; fly=@(t,y) -1; flt=@(t,y) 6*t-2;

% Ejecución
[sol, val] = gestor_analitico(ode, cond, T, VERBOSE);
dat = gestor_numerico(f, fly, flt, y0, T, VERBOSE);
gestor_errores(dat, val, VERBOSE);
gestor_grafico(dat, sol, T, 'Problema 1', VERBOSE);
