function gestor_grafico(datos, sol_func, T, titulo)
    fprintf('\n[TRAZA - GRÁFICOS] Generando figura comparativa: %s...\n', titulo);
    
    f = figure('Name', titulo, 'NumberTitle', 'off', 'Color', 'w');
    hold on;
    
    % 1. Solución Exacta (Negro sólido)
    fplot(sol_func, [0, T], 'k-', 'LineWidth', 2, 'DisplayName', 'Solución Exacta');
    
    % 2. Aproximaciones (Punteadas/Guiones)
    g = datos.graficos;
    plot(g.t, g.eu, 'r--', 'LineWidth', 1.2, 'DisplayName', 'Euler (n=640)');
    plot(g.t, g.he, 'g-.', 'LineWidth', 1.2, 'DisplayName', 'Heun (n=640)');
    plot(g.t, g.rk4, 'b:',  'LineWidth', 1.5, 'DisplayName', 'RK4 (n=640)');
    % Taylor a veces se solapa mucho, usamos marcadores espaciados o línea fina
    plot(g.t, g.tay, 'm--', 'LineWidth', 1, 'DisplayName', 'Taylor2 (n=640)');
    
    % 3. Estética
    title(['Comparativa de Métodos: ' titulo], 'FontSize', 12);
    subtitle('Solución Analítica vs Aproximaciones Numéricas (n=640)');
    xlabel('Tiempo (t)');
    ylabel('Solución y(t)');
    legend('Location', 'bestoutside');
    grid on;
    box on;
    hold off;
    
    fprintf('    >> Gráfica generada en ventana nueva.\n');
    fprintf('[TRAZA - GRÁFICOS] Finalizado.\n');
end
