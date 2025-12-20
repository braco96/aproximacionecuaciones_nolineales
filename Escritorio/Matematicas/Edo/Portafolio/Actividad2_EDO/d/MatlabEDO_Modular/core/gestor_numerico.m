function [datos] = gestor_numerico(f, fly, flt, y0, T)
    % GESTOR_NUMERICO: Ejecuta los bucles de aproximación
    
    addpath('../lib');
    fprintf('\n[TRAZA] --- INICIO MÓDULO NUMÉRICO ---\n');
    
    datos.n = [];
    datos.finales = []; % Matriz para guardar resultados finales
    datos.graficos = {}; % Celda para guardar vectores de tiempo y solución para graficar
    
    for j = 0:6
        n = 10 * 2^j;
        fprintf('   [ITERACIÓN] j=%d, Pasos n=%d\n', j, n);
        
        % Llamada a los motores
        [t, y_eu]  = eulerexp(y0, f, T, n);
        [~, y_he]  = rk2(y0, f, T, n);
        [~, y_rk4] = rk4(y0, f, T, n);
        [~, y_tay] = taylor2(y0, f, fly, flt, T, n);
        
        % Guardar datos
        datos.n = [datos.n; n];
        datos.finales = [datos.finales; y_eu(end), y_he(end), y_rk4(end), y_tay(end)];
        
        % Guardamos la última iteración completa para el módulo gráfico
        if j == 6
            fprintf('   [INFO] Guardando trazas para graficado de alta resolución...\n');
            datos.graficos.t = t;
            datos.graficos.eu = y_eu;
            datos.graficos.he = y_he;
            datos.graficos.rk4 = y_rk4;
            datos.graficos.tay = y_tay;
        end
    end
    fprintf('[TRAZA] --- FIN MÓDULO NUMÉRICO ---\n');
end
