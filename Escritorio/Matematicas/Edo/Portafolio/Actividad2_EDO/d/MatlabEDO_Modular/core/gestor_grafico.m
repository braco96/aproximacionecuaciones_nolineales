function gestor_grafico(datos_numericos, sol_exacta_func, T, titulo)
    % GESTOR_GRAFICO: Genera las visualizaciones
    
    fprintf('\n[TRAZA] --- GENERANDO GRÁFICAS ---\n');
    
    figure('Name', titulo, 'NumberTitle', 'off');
    hold on;
    
    % 1. Solución Exacta
    fplot(sol_exacta_func, [0, T], 'k-', 'LineWidth', 2, 'DisplayName', 'Solución Exacta');
    
    % 2. Aproximaciones (usando los datos de la iteración más fina n=640)
    g = datos_numericos.graficos;
    plot(g.t, g.eu, 'r--', 'DisplayName', 'Euler (n=640)');
    plot(g.t, g.he, 'g--', 'DisplayName', 'Heun (n=640)');
    plot(g.t, g.rk4, 'b-.', 'DisplayName', 'RK4 (n=640)');
    plot(g.t, g.tay, 'm:',  'DisplayName', 'Taylor2 (n=640)');
    
    % 3. Decoración
    title(['Comparativa: ' titulo]);
    xlabel('Tiempo (t)');
    ylabel('Solución (y)');
    legend('Location', 'best');
    grid on;
    hold off;
    
    fprintf('[INFO] Figura generada correctamente.\n');
end
