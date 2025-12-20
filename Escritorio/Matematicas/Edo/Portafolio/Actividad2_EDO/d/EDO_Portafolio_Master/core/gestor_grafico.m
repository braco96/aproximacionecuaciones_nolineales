function gestor_grafico(datos, sol_func, T, titulo, verbose)
    if verbose, fprintf('\n[TRAZA] Generando gráfica estándar: %s\n', titulo); end
    
    figure('Name', titulo, 'Color', 'w'); hold on;
    fplot(sol_func, [0, T], 'k-', 'LineWidth', 2, 'DisplayName', 'Exacta');
    
    g = datos.graficos;
    plot(g.t, g.eu, 'r--', 'DisplayName', 'Euler');
    plot(g.t, g.he, 'g-.', 'DisplayName', 'Heun');
    plot(g.t, g.rk4, 'b:',  'DisplayName', 'RK4');
    plot(g.t, g.tay, 'm--', 'DisplayName', 'Taylor2');
    
    title(titulo); legend('Location', 'best'); grid on; hold off;
end
