%% Resolución Problema 1
clear; clc; close all;
addpath('../core', '../lib');

% 1. Definición de Parámetros (y' = -y + 3t^2 - 2t + 1)
T = 2; y0 = 1; graficar = true;

f   = @(y,t) -y + 3*t.^2 - 2*t + 1;
fly = @(y,t) -1;          % df/dy
flt = @(y,t) 6*t - 2;     % df/dt

syms y(t) t_sym
ode_sym = diff(y,t_sym) == -y + 3*t_sym^2 - 2*t_sym + 1;
cond_sym = y(0) == 1;

fprintf('=== EJECUCIÓN PROBLEMA 1 ===\n');

% 2. Ejecución Secuencial por Apartados
datos_A = apartado_a(f, fly, flt, y0, T, graficar);        % Ejecuta A
val_B   = apartado_b(ode_sym, cond_sym, T, graficar);      % Ejecuta B
tabla_C = apartado_c(datos_A, val_B);                      % Ejecuta C
apartado_d(tabla_C);                                       % Ejecuta D
