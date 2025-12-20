function experimento_completo
    clear; clc; close all;
    syms y(t) t

    %% ====================================================================
    %  PROBLEMA 1
    %  y' = -y + 3t^2 - 2t + 1, y(0)=1
    % ====================================================================
    fprintf('==========================================================\n');
    fprintf(' INICIO EXPERIMENTO PROBLEMA 1\n');
    fprintf('==========================================================\n');
    
    % 1. Definición Simbólica y Solución Exacta
    ode1 = diff(y,t) == -y + 3*t^2 - 2*t + 1;
    cond1 = y(0) == 1;
    sol1 = dsolve(ode1, cond1);
    psol1 = matlabFunction(sol1); % Convertir a función usable

    % Salida de texto solicitada
    fprintf('para la ecuacion y'' = -y + 3t^2 - 2t + 1 su solucion sera :\n');
    disp(sol1);
    
    % 2. Definición de Funciones para Métodos Numéricos
    % f(t,y), df/dy (fly), df/dt (flt) necesarias para Taylor
    f   = @(t,y) -y + 3*t.^2 - 2*t + 1;
    fly = @(t,y) -1;          % Derivada parcial respecto a y
    flt = @(t,y) 6*t - 2;     % Derivada parcial respecto a t
    
    % 3. Ejecutar Análisis Numérico (Bucle, Errores, Gráficas)
    ejecutar_analisis(y(0)==1, f, fly, flt, psol1, 2, 'Problema 1');

    
    %% ====================================================================
    %  PROBLEMA 2
    %  y' = 2y - sin(t) + 1, y(0)=0
    % ====================================================================
    fprintf('\n\n==========================================================\n');
    fprintf(' INICIO EXPERIMENTO PROBLEMA 2\n');
    fprintf('==========================================================\n');

    % 1. Definición Simbólica
    ode2 = diff(y,t) == 2*y - sin(t) + 1;
    cond2 = y(0) == 0;
    sol2 = dsolve(ode2, cond2);
    psol2 = matlabFunction(sol2);

    % Salida de texto solicitada
    fprintf('para la ecuacion y'' = 2y - sin(t) + 1 su solucion sera :\n');
    disp(sol2);

    % 2. Definición de Funciones
    f   = @(t,y) 2*y - sin(t) + 1;
    fly = @(t,y) 2;           % Derivada parcial respecto a y
    flt = @(t,y) -cos(t);     % Derivada parcial respecto a t
    
    % 3. Ejecutar Análisis
    ejecutar_analisis(y(0)==0, f, fly, flt, psol2, 2, 'Problema 2');

end

%% ========================================================================
%  FUNCIÓN MAESTRA DE ANÁLISIS (El "Experimento")
%  Esta función hace el bucle de las capturas (Euler, Taylor, RK2, RK4)
% ========================================================================
function ejecutar_analisis(cond_ini, f, fly, flt, sol_exacta, T_final, titulo)
    
    % Obtener valor inicial numérico de la condición simbólica (ej. "y(0)=1" -> 1)
    y0 = double(rhs(cond_ini)); 
    
    % Arrays para guardar errores
    pasos = [];
    err_eu = []; err_tay = []; err_rk2 = []; err_rk4 = [];
    
    fprintf('\nEjecutando métodos numéricos...\n');
    fprintf('%-10s %-12s %-12s %-12s %-12s\n', 'n', 'Err Euler', 'Err Taylor', 'Err RK2', 'Err RK4');
    
    % Bucle idéntico a tu imagen "image_9fb95e.png"
    % Iteramos i de 0 a 5 para ir duplicando n
    for i = 1:6
        n = 10 * 2^i; % Pasos: 10, 20, 40, 80...
        
        % Llamadas a los solvers (definidos abajo)
        [t, y_eu]  = metodo_euler(y0, f, T_final, n);
        [t, y_tay] = metodo_taylor2(y0, f, fly, flt, T_final, n);
        [t, y_rk2] = metodo_rk2(y0, f, T_final, n);
        [t, y_rk4] = metodo_rk4(y0, f, T_final, n);
        
        % Cálculo del error en el punto final (T_final)
        y_real = sol_exacta(T_final);
        
        e1 = abs(y_eu(end) - y_real);
        e2 = abs(y_tay(end) - y_real);
        e3 = abs(y_rk2(end) - y_real);
        e4 = abs(y_rk4(end) - y_real);
        
        % Guardamos para calcular órdenes
        pasos = [pasos; n];
        err_eu = [err_eu; e1]; err_tay = [err_tay; e2];
        err_rk2 = [err_rk2; e3]; err_rk4 = [err_rk4; e4];
        
        fprintf('%-10d %-12.2e %-12.2e %-12.2e %-12.2e\n', n, e1, e2, e3, e4);
    end
    
    % Cálculo de Órdenes de Convergencia (formula: log2(Error_prev / Error_act))
    % Como en las últimas líneas de tu imagen
    o_eu  = log2(err_eu(1:end-1) ./ err_eu(2:end));
    o_tay = log2(err_tay(1:end-1) ./ err_tay(2:end));
    o_rk2 = log2(err_rk2(1:end-1) ./ err_rk2(2:end));
    o_rk4 = log2(err_rk4(1:end-1) ./ err_rk4(2:end));
    
    fprintf('\n--- Órdenes de Convergencia Estimados (Promedio) ---\n');
    fprintf('Euler (Esperado 1): %.2f\n', mean(o_eu));
    fprintf('Taylor (Esperado 2): %.2f\n', mean(o_tay));
    fprintf('RK2   (Esperado 2): %.2f\n', mean(o_rk2));
    fprintf('RK4   (Esperado 4): %.2f\n', mean(o_rk4));

    % Gráfica comparativa (solo de la última iteración con n alto)
    figure('Name', [titulo ' - Métodos Numéricos']);
    plot(t, sol_exacta(t), 'k-', 'LineWidth', 2); hold on;
    plot(t, y_eu, 'r--');
    plot(t, y_rk2, 'g--');
    plot(t, y_rk4, 'b--');
    plot(t, y_tay, 'm:');
    legend('Exacta', 'Euler', 'RK2 (Heun)', 'RK4', 'Taylor 2');
    title([titulo ': Comparación de Métodos (n=' num2str(n) ')']);
    grid on; hold off;
end

%% ========================================================================
%  SOLVERS NUMÉRICOS (Implementación de los algoritmos)
% ========================================================================

function [t, y] = metodo_euler(y0, f, T, n)
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        y(i+1) = y(i) + h * f(t(i), y(i));
    end
end

function [t, y] = metodo_rk2(y0, f, T, n) % Método de Heun
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        k1 = f(t(i), y(i));
        k2 = f(t(i)+h, y(i) + h*k1);
        y(i+1) = y(i) + (h/2) * (k1 + k2);
    end
end

function [t, y] = metodo_rk4(y0, f, T, n)
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        k1 = f(t(i), y(i));
        k2 = f(t(i)+0.5*h, y(i) + 0.5*h*k1);
        k3 = f(t(i)+0.5*h, y(i) + 0.5*h*k2);
        k4 = f(t(i)+h, y(i) + h*k3);
        y(i+1) = y(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end

function [t, y] = metodo_taylor2(y0, f, fly, flt, T, n)
    t = linspace(0, T, n+1);
    h = T/n;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        % Derivada primera: y' = f
        d1 = f(t(i), y(i));
        % Derivada segunda: y'' = f_t + f * f_y (Regla de la cadena)
        d2 = flt(t(i), y(i)) + d1 * fly(t(i), y(i));
        
        % Formula Taylor orden 2: y + h*y' + 0.5*h^2*y''
        y(i+1) = y(i) + h*d1 + 0.5*h^2*d2;
    end
end