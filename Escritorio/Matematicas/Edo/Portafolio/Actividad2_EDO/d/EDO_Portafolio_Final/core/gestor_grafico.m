function gestor_grafico(datos, sol_func, T, titulo)
    fprintf('\n[TRAZA]Generando gráfica para: %s...\n', titulo);
    
    figure('Name', titulo, 'NumberTitle', 'off'); hold on;
    fplot(sol_func, [0, T], 'k-', 'LineWidth', 2, 'DisplayName', 'Exacta');
    
    g = datos.graficos;
    plot(g.t, g.eu, 'r--', 'DisplayName', 'Euler');
    plot(g.t, g.he, 'g--', 'DisplayName', 'Heun');
    plot(g.t, g.rk4, 'b-.', 'DisplayName', 'RK4');
    plot(g.t, g.tay, 'm:',  'DisplayName', 'Taylor2');
    
    title(['Aproximaciones: ' titulo]);
    legend('Location', 'best'); grid on; hold off;
end
