function [tabla_errores] = analizar_edo(f, fly, flt, y0, T, sol_exacta_func, graficar, titulo)
    % ANALIZAR_EDO Ejecuta los 4 métodos numéricos para n = 10*2^j
    % Parámetros:
    %   f, fly, flt: Handles de la función y sus derivadas parciales
    %   y0: Condición inicial
    %   T: Tiempo final
    %   sol_exacta_func: Handle de la solución analítica (para calcular error)
    %   graficar: (true/false) Booleano para activar/desactivar gráficas
    %   titulo: String para el título de la gráfica

    addpath('../lib'); % Asegurar acceso a los algoritmos
    
    fprintf('\n>>> Iniciando Análisis Numérico: %s\n', titulo);
    fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Err Euler', 'Err Heun', 'Err RK4', 'Err Taylor2');
    fprintf('------------------------------------------------------------------------\n');

    tabla_errores = [];
    
    % Variables para guardar la última iteración para graficar (la de mayor precisión)
    t_plot = []; y_eu_plot = []; y_rk4_plot = [];

    for j = 0:6
        n = 10 * 2^j;
        
        % Ejecución de tus scripts originales
        [t, y_eu] = eulerexp(y0, f, T, n);
        [~, y_he] = rk2(y0, f, T, n);
        [~, y_r4] = rk4(y0, f, T, n);
        [~, y_ta] = taylor2(y0, f, fly, flt, T, n);
        
        % Cálculo de errores en t=T
        val_exacto = sol_exacta_func(T);
        errs = abs([y_eu(end), y_he(end), y_r4(end), y_ta(end)] - val_exacto);
        
        tabla_errores = [tabla_errores; n, errs];
        fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', n, errs(1), errs(2), errs(3), errs(4));

        % Guardamos datos de la última iteración (mayor n) para graficar si se pide
        if j == 6
            t_plot = t;
            y_eu_plot = y_eu;
            y_rk4_plot = y_r4;
        end
    end

    % --- LOGICA DE GRAFICADO PARAMETRIZADA ---
    if graficar
        figure('Name', ['Resultados: ' titulo]);
        hold on;
        % 1. Solución Exacta
        fplot(sol_exacta_func, [0 T], 'k-', 'LineWidth', 2);
        
        % 2. Aproximaciones (Graficamos Euler y RK4 como referencia de extremos)
        plot(t_plot, y_eu_plot, 'r--', 'DisplayName', 'Euler (n=640)');
        plot(t_plot, y_rk4_plot, 'b-.', 'DisplayName', 'RK4 (n=640)');
        
        title(['Solución vs Aproximaciones: ' titulo]);
        xlabel('t'); ylabel('y');
        legend('Solución Exacta', 'Euler', 'RK4', 'Location', 'best');
        grid on; hold off;
        fprintf('   [INFO] Gráfica generada.\n');
    else
        fprintf('   [INFO] Gráfica omitida por parámetro (graficar=false).\n');
    end
end
