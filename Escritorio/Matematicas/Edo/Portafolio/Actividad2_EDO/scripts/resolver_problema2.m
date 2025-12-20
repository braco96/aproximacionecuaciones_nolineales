%% Script para Resolver el Problema 2 (Actividad 2)
clear; clc; close all;
addpath('../core', '../utils', '../lib');

% 1. Definición del Problema
% y' = 2y - sin(t) + 1, y(0)=0
syms y(t) t_sym
ode_sym = diff(y,t_sym) == 2*y - sin(t_sym) + 1;
cond_sym = y(0) == 0;

% Funciones numéricas
f   = @(y,t) 2*y - sin(t) + 1;
fly = @(y,t) 2;           % df/dy
flt = @(y,t) -cos(t);     % df/dt
y0 = 0; 
T = 2;

% 2. Obtener Solución Analítica
fprintf('=== PROBLEMA 2: Solución Analítica ===\n');
[psol, texto_sol] = resolver_analitica(ode_sym, cond_sym);

% 3. Ejecutar Métodos Numéricos
% PARAMETRIZACIÓN: Aquí activamos la gráfica
graficar_solucion = true; 

fprintf('\n=== PROBLEMA 2: Métodos Numéricos ===\n');
tabla_p2 = analizar_edo(f, fly, flt, y0, T, psol, graficar_solucion, 'Problema 2');

% 4. Análisis de Convergencia
fprintf('\n=== PROBLEMA 2: Orden de Convergencia (Estimado) ===\n');
err_final = tabla_p2(end, 2:5);
err_prev  = tabla_p2(end-1, 2:5);
ordenes = log2(err_prev ./ err_final);
fprintf('Euler: %.2f | Heun: %.2f | RK4: %.2f | Taylor2: %.2f\n', ...
    ordenes(1), ordenes(2), ordenes(3), ordenes(4));
