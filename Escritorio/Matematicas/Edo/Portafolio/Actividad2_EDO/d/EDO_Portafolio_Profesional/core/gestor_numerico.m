function [datos] = gestor_numerico(f, fly, flt, y0, T, verbose)
    % Carga de librería
    ruta_actual = fileparts(mfilename('fullpath'));
    addpath(fullfile(ruta_actual, '..', 'lib'));

    if verbose
        fprintf('\n============================================================\n');
        fprintf(' APARTADO A: APLICACIÓN DE MÉTODOS NUMÉRICOS\n');
        fprintf('============================================================\n');
        fprintf('Enunciado: Aplica Euler explícito, Heun, RK4 y Taylor 2 para T=%.1f con n=10*2^j.\n', T);
        fprintf('Definiciones de Métodos utilizados:\n');
        fprintf('   1. Euler:   y_{n+1} = y_n + h * f(t_n, y_n)\n');
        fprintf('   2. Heun:    y_{n+1} = y_n + (h/2) * (k1 + k2)\n');
        fprintf('   3. RK4:     y_{n+1} = y_n + (h/6) * (k1 + 2k2 + 2k3 + k4)\n');
        fprintf('   4. Taylor2: y_{n+1} = y_n + h*y'' + (h^2/2)*y''''\n\n');
    end
    
    datos.n = [];
    datos.finales = []; 
    datos.graficos = {}; 
    
    for j = 0:6
        n = 10 * 2^j;
        if verbose, fprintf('   [EJECUCIÓN] Iteración j=%d | Pasos n=%d | Tamaño paso h=%.4f\n', j, n, T/n); end
        
        [t, y_eu]  = eulerexp(y0, f, T, n);
        [~, y_he]  = rk2(y0, f, T, n);
        [~, y_rk4] = rk4(y0, f, T, n);
        [~, y_tay] = taylor2(y0, f, fly, flt, T, n);
        
        datos.n = [datos.n; n];
        datos.finales = [datos.finales; y_eu(end), y_he(end), y_rk4(end), y_tay(end)];
        
        if j == 6
            if verbose, fprintf('      >> Guardando trazas de alta resolución (n=%d) para gráficos.\n', n); end
            datos.graficos.t = t;
            datos.graficos.eu = y_eu;
            datos.graficos.he = y_he;
            datos.graficos.rk4 = y_rk4;
            datos.graficos.tay = y_tay;
        end
    end
    
    if verbose, fprintf('--- Fin Apartado A ---\n'); end
end
