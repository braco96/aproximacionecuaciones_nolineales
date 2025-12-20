%% SCRIPT DE EJECUCIÓN: PROBLEMA 2
% Este script orquesta todos los módulos para resolver el Problema 2.
clear; clc; close all;
addpath('../core', '../lib');

fprintf('==========================================================\n');
fprintf('       RESOLUCIÓN COMPLETA: PROBLEMA 2\n');
fprintf('==========================================================\n');

% 1. DEFINICIÓN DEL PROBLEMA
% Ecuación: y' = 2y - sin(t) + 1, y(0)=0
T = 2; 
y0 = 0;

% Definición simbólica
syms y(t) t
ode_sym = diff(y,t) == 2*y - sin(t) + 1;
cond_sym = y(0) == 0;

% Definición numérica
% IMPORTANTE: Orden @(t,y)
f   = @(t,y) 2*y - sin(t) + 1;
fly = @(t,y) 2;           % df/dy
flt = @(t,y) -cos(t);     % df/dt

% 2. EJECUCIÓN SECUENCIAL
[sol_exacta_func, val_exacto] = gestor_analitico(ode_sym, cond_sym, T);
datos_num = gestor_numerico(f, fly, flt, y0, T);
gestor_errores(datos_num, val_exacto);
gestor_grafico(datos_num, sol_exacta_func, T, 'Problema 2');

fprintf('\n=== EJECUCIÓN FINALIZADA CON ÉXITO ===\n');
