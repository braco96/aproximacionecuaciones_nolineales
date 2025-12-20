%% SCRIPT DE EJECUCIÓN: PROBLEMA 1
% Este script orquesta todos los módulos para resolver el Problema 1.
clear; clc; close all;
addpath('../core', '../lib'); % Importar módulos

fprintf('==========================================================\n');
fprintf('       RESOLUCIÓN COMPLETA: PROBLEMA 1\n');
fprintf('==========================================================\n');

% 1. DEFINICIÓN DEL PROBLEMA
% Ecuación: y' = -y + 3t^2 - 2t + 1, y(0)=1
T = 2; 
y0 = 1;

% Definición simbólica (para módulo analítico)
syms y(t) t 
ode_sym = diff(y,t) == -y + 3*t^2 - 2*t + 1;
cond_sym = y(0) == 1;

% Definición numérica (para módulo numérico)
% IMPORTANTE: Orden @(t,y)
f   = @(t,y) -y + 3*t.^2 - 2*t + 1;
fly = @(t,y) -1;          % df/dy
flt = @(t,y) 6*t - 2;     % df/dt

% 2. EJECUCIÓN SECUENCIAL
% Paso A: Obtener solución analítica
[sol_exacta_func, val_exacto] = gestor_analitico(ode_sym, cond_sym, T);

% Paso B: Obtener aproximaciones numéricas
datos_num = gestor_numerico(f, fly, flt, y0, T);

% Paso C: Análisis de errores y convergencia
gestor_errores(datos_num, val_exacto);

% Paso D: Visualización
gestor_grafico(datos_num, sol_exacta_func, T, 'Problema 1');

fprintf('\n=== EJECUCIÓN FINALIZADA CON ÉXITO ===\n');
