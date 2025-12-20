function gestor_grafico(datos, sol_func, T, titulo, verbose)
    if verbose
        fprintf('\n[GRAFICOS] Generando ventana de visualización para: %s\n', titulo);
    end
    
    figure('Name', titulo, 'NumberTitle', 'off', 'Color', 'w'); hold on;
    
    % Exacta
    fplot(sol_func, [0, T], 'k-', 'LineWidth', 2, 'DisplayName', 'Exacta (Analítica)');
    
    % Aproximaciones
    g = datos.graficos;
    plot(g.t, g.eu, 'r--', 'LineWidth', 1.2, 'DisplayName', 'Euler');
    plot(g.t, g.he, 'g-.', 'LineWidth', 1.2, 'DisplayName', 'Heun');
    plot(g.t, g.rk4, 'b:',  'LineWidth', 1.5, 'DisplayName', 'RK4');
    plot(g.t, g.tay, 'm--', 'LineWidth', 1,   'DisplayName', 'Taylor2');
    
    title(['Comparativa: ' titulo]);
    xlabel('t'); ylabel('y(t)');
    legend('Location', 'bestoutside');
    grid on; box on; hold off;
end
