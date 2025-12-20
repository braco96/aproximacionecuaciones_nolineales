function gestor_investigacion(f, fly, flt, y0, T, sol_exacta, titulo, verbose)
    % GESTOR_INVESTIGACION: Barrido masivo de n y gráfica Log-Log
    ruta_actual = fileparts(mfilename('fullpath'));
    addpath(fullfile(ruta_actual, '..', 'lib'));

    if verbose
        fprintf('\n============================================================\n');
        fprintf(' INVESTIGACIÓN DE CONVERGENCIA: %s\n', titulo);
        fprintf('============================================================\n');
        fprintf('Objetivo: Visualizar el orden de convergencia mediante gráfica Log-Log.\n');
        fprintf('Metodología: Ejecutar solvers para n desde 10 hasta 5000.\n');
    end

    % 1. Definir rango de pasos (Escala logarítmica)
    N_vals = unique(round(logspace(1, 3.7, 15))); % De 10 a ~5000
    errores = [];

    % 2. Bucle de ejecución
    for i = 1:length(N_vals)
        n = N_vals(i);
        if verbose, fprintf('   [INVESTIGACIÓN] Probando n=%d...\n', n); end
        
        [~, ye] = eulerexp(y0, f, T, n);
        [~, yh] = rk2(y0, f, T, n);
        [~, yr] = rk4(y0, f, T, n);
        [~, yt] = taylor2(y0, f, fly, flt, T, n);
        
        val_exacto = sol_exacta(T);
        e = abs([ye(end), yh(end), yr(end), yt(end)] - val_exacto);
        errores = [errores; e];
    end

    % 3. Generar Gráfica Log-Log (La prueba de fuego de la convergencia)
    if verbose, fprintf('   [GRÁFICO] Generando gráfica de convergencia Log-Log...\n'); end
    
    figure('Name', ['Convergencia ' titulo], 'Color', 'w');
    loglog(N_vals, errores(:,1), 'r-o', 'LineWidth', 1.5, 'DisplayName', 'Euler (p=1)'); hold on;
    loglog(N_vals, errores(:,2), 'g-s', 'LineWidth', 1.5, 'DisplayName', 'Heun (p=2)');
    loglog(N_vals, errores(:,4), 'm-^', 'LineWidth', 1.5, 'DisplayName', 'Taylor2 (p=2)');
    loglog(N_vals, errores(:,3), 'b-d', 'LineWidth', 1.5, 'DisplayName', 'RK4 (p=4)');
    
    % Decoración
    grid on; xlabel('Número de pasos (n)'); ylabel('Error Global en T');
    title(['Análisis de Convergencia: ' titulo]);
    subtitle('Las pendientes indican el orden del método');
    legend('Location', 'best');
    set(gca, 'XDir', 'reverse'); % Opcional: A veces se prefiere ver h decreciendo
    hold off;
    
    if verbose
        fprintf('[FIN INVESTIGACIÓN] Gráfica generada.\n');
    end
end
