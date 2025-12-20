function [res] = apartado_a(f, fly, flt, y0, T, graficar)
    addpath('../lib');
    fprintf('\n--- [Apartado A] Ejecutando Métodos Numéricos ---\n');
    
    res.n_vals = [];
    res.finals = []; % Guardará los valores finales para el Apartado C
    
    % Inicializar gráfica
    if graficar
        figure; hold on;
        title('Apartado A: Aproximaciones Numéricas (Mejor n)');
        xlabel('t'); ylabel('y');
    end

    for j = 0:6
        n = 10 * 2^j;
        res.n_vals = [res.n_vals; n];
        
        [t, y_eu] = eulerexp(y0, f, T, n);
        [~, y_he] = rk2(y0, f, T, n);
        [~, y_r4] = rk4(y0, f, T, n);
        [~, y_ta] = taylor2(y0, f, fly, flt, T, n);
        
        % Guardamos valores finales para la tabla de errores
        res.finals = [res.finals; y_eu(end), y_he(end), y_r4(end), y_ta(end)];
        
        % Graficamos solo la iteración con más pasos (j=6) para limpieza visual
        if graficar && j == 6
            plot(t, y_eu, 'r--', 'DisplayName', 'Euler');
            plot(t, y_he, 'g--', 'DisplayName', 'Heun');
            plot(t, y_r4, 'b-.', 'DisplayName', 'RK4');
            plot(t, y_ta, 'm:',  'DisplayName', 'Taylor2');
        end
    end
    
    if graficar
        legend('Location','best');
        grid on; hold off;
    end
end
