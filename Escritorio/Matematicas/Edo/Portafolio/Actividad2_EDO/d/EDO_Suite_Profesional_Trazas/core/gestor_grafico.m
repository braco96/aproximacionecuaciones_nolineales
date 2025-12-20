function gestor_grafico(datos, sol_func, T, titulo, verbose)
    if verbose
        fprintf('\n[GRÁFICOS] Generando visualización para %s...\n', titulo);
        fprintf('   - Trazando Solución Exacta\n');
        fprintf('   - Trazando Euler, Heun, RK4, Taylor2\n');
    end
    
    figure('Name', titulo, 'NumberTitle', 'off', 'Color', 'w'); hold on;
    
    % Exacta
    fplot(sol_func, [0, T], 'k-', 'LineWidth', 2, 'DisplayName', 'Exacta (Analítica)');
    
    % Aproximaciones (Los 4 métodos solicitados)
    g = datos.graficos;
    plot(g.t, g.eu, 'r--', 'LineWidth', 1.2, 'DisplayName', '1. Euler');
    plot(g.t, g.he, 'g-.', 'LineWidth', 1.2, 'DisplayName', '2. Heun');
    plot(g.t, g.rk4, 'b:',  'LineWidth', 1.5, 'DisplayName', '3. RK4');
    plot(g.t, g.tay, 'm--', 'LineWidth', 1,   'DisplayName', '4. Taylor2');
    
    title(['Comparativa de Métodos: ' titulo]);
    xlabel('Tiempo (t)'); ylabel('Solución y(t)');
    legend('Location', 'bestoutside');
    grid on; box on; hold off;
    
    if verbose, fprintf('   >> Gráfica generada con éxito.\n'); end
end
