%% Script para Resolver el Problema 1 (Actividad 2)
clear; clc; close all;
addpath('../core', '../utils', '../lib');

% 1. Definición del Problema
% y' = -y + 3t^2 - 2t + 1, y(0)=1
syms y(t) t_sym
ode_sym = diff(y,t_sym) == -y + 3*t_sym^2 - 2*t_sym + 1;
cond_sym = y(0) == 1;

% Funciones numéricas para los métodos
f   = @(y,t) -y + 3*t.^2 - 2*t + 1;
fly = @(y,t) -1;          % df/dy
flt = @(y,t) 6*t - 2;     % df/dt
y0 = 1; 
T = 2;

% 2. Obtener Solución Analítica (Apartado B automatizado)
fprintf('=== PROBLEMA 1: Solución Analítica ===\n');
[psol, texto_sol] = resolver_analitica(ode_sym, cond_sym);

% 3. Ejecutar Métodos Numéricos (Apartado A, C)
% PARAMETRIZACIÓN: Cambia 'true' a 'false' para ocultar gráfica
graficar_solucion = true; 

fprintf('\n=== PROBLEMA 1: Métodos Numéricos ===\n');
tabla_p1 = analizar_edo(f, fly, flt, y0, T, psol, graficar_solucion, 'Problema 1');

% 4. Análisis de Convergencia (Apartado D)
fprintf('\n=== PROBLEMA 1: Orden de Convergencia (Estimado) ===\n');
err_final = tabla_p1(end, 2:5);
err_prev  = tabla_p1(end-1, 2:5);
ordenes = log2(err_prev ./ err_final);
fprintf('Euler: %.2f | Heun: %.2f | RK4: %.2f | Taylor2: %.2f\n', ...
    ordenes(1), ordenes(2), ordenes(3), ordenes(4));
