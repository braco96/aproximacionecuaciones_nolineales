function [datos] = gestor_numerico(f, fly, flt, y0, T, verbose)
    % Carga de librería dinámica
    ruta_actual = fileparts(mfilename('fullpath'));
    addpath(fullfile(ruta_actual, '..', 'lib'));

    if verbose
        fprintf('\n============================================================\n');
        fprintf(' [APARTADO A] APLICACIÓN DE MÉTODOS NUMÉRICOS\n');
        fprintf('============================================================\n');
        fprintf('Objetivo: Aproximar y(t) usando Euler, Heun, RK4 y Taylor2.\n');
        fprintf('Métodos a ejecutar (t1, t2, t3, t4):\n');
        fprintf('   1. Euler Explícito (Orden 1)\n');
        fprintf('   2. Heun / RK2 (Orden 2)\n');
        fprintf('   3. Runge-Kutta 4 (Orden 4)\n');
        fprintf('   4. Taylor Orden 2 (Orden 2)\n');
    end
    
    datos.n = [];
    datos.finales = []; 
    datos.graficos = {}; 
    
    for j = 0:6
        n = 10 * 2^j;
        if verbose, fprintf('   [ITERACIÓN] j=%d | Pasos n=%d | h=%.4f\n', j, n, T/n); end
        
        [t, y_eu]  = eulerexp(y0, f, T, n);
        [~, y_he]  = rk2(y0, f, T, n);
        [~, y_rk4] = rk4(y0, f, T, n);
        [~, y_tay] = taylor2(y0, f, fly, flt, T, n);
        
        datos.n = [datos.n; n];
        datos.finales = [datos.finales; y_eu(end), y_he(end), y_rk4(end), y_tay(end)];
        
        % Guardamos la mejor iteración (j=6) para graficar
        if j == 6
            if verbose, fprintf('      >> Guardando trazas de alta resolución (n=%d) para gráficos.\n', n); end
            datos.graficos.t = t;
            datos.graficos.eu = y_eu;
            datos.graficos.he = y_he;
            datos.graficos.rk4 = y_rk4;
            datos.graficos.tay = y_tay;
        end
    end
    
    if verbose, fprintf('------------------------------------------------------------\n'); end
end
