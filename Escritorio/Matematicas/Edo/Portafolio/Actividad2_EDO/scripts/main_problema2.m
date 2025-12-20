%% Resolución Problema 2
clear; clc; close all;
addpath('../core', '../lib');

% 1. Definición de Parámetros (y' = 2y - sin(t) + 1)
T = 2; y0 = 0; graficar = true;

f   = @(y,t) 2*y - sin(t) + 1;
fly = @(y,t) 2;           % df/dy
flt = @(y,t) -cos(t);     % df/dt

syms y(t) t_sym
ode_sym = diff(y,t_sym) == 2*y - sin(t_sym) + 1;
cond_sym = y(0) == 0;

fprintf('=== EJECUCIÓN PROBLEMA 2 ===\n');

% 2. Ejecución Secuencial por Apartados
datos_A = apartado_a(f, fly, flt, y0, T, graficar);        % Ejecuta A
val_B   = apartado_b(ode_sym, cond_sym, T, graficar);      % Ejecuta B
tabla_C = apartado_c(datos_A, val_B);                      % Ejecuta C
apartado_d(tabla_C);                                       % Ejecuta D
