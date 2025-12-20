function [datos] = gestor_numerico_descendente(f, fly, flt, y0, T)
    % GESTOR_NUMERICO_DESCENDENTE
    % Ejecuta 5 iteraciones desde la más precisa (n alto) a la menos precisa.
    % Muestra definiciones teóricas al inicio.
    
    % Carga dinámica de librerías
    ruta_actual = fileparts(mfilename('fullpath'));
    addpath(fullfile(ruta_actual, '..', 'lib'));

    fprintf('\n============================================================\n');
    fprintf(' APARTADO A (MODO DESCENDENTE): DEFINICIONES Y EJECUCIÓN\n');
    fprintf('============================================================\n');
    
    % 1. IMPRIMIR DEFINICIONES (Tal como pediste)
    fprintf('Definiciones de Métodos utilizados:\n');
    fprintf('   1. Euler:   y_{n+1} = y_n + h * f(t_n, y_n)\n');
    fprintf('   2. Heun:    y_{n+1} = y_n + (h/2) * (k1 + k2)\n');
    fprintf('   3. RK4:     y_{n+1} = y_n + (h/6) * (k1 + 2k2 + 2k3 + k4)\n');
    fprintf('   4. Taylor2: y_{n+1} = y_n + h*y'' + (h^2/2)*y''''\n\n');
    
    datos.n = [];
    datos.finales = []; 
    datos.graficos = {}; 
    
    % 2. BUCLE DESCENDENTE (De más iteraciones a menos)
    % j=6 (n=640) hasta j=2 (n=40) -> Total 5 formas
    iteraciones = [6, 5, 4, 3, 2];
    
    for k = 1:length(iteraciones)
        j = iteraciones(k);
        n = 10 * 2^j;
        h = T/n;
        
        fprintf('   [EJECUCIÓN] Iteración j=%d | Pasos n=%-3d | Tamaño paso h=%.4f\n', j, n, h);
        
        % Ejecución de los motores matemáticos
        [t, y_eu]  = eulerexp(y0, f, T, n);
        [~, y_he]  = rk2(y0, f, T, n);
        [~, y_rk4] = rk4(y0, f, T, n);
        [~, y_tay] = taylor2(y0, f, fly, flt, T, n);
        
        % Guardamos resultados
        datos.n = [datos.n; n];
        datos.finales = [datos.finales; y_eu(end), y_he(end), y_rk4(end), y_tay(end)];
        
        % Guardamos la traza de mayor resolución (la primera, j=6) para gráficas
        if j == 6
            fprintf('      >> Guardando trazas de alta resolución (n=%d) para gráficos.\n', n);
            datos.graficos.t = t;
            datos.graficos.eu = y_eu;
            datos.graficos.he = y_he;
            datos.graficos.rk4 = y_rk4;
            datos.graficos.tay = y_tay;
        end
    end
    fprintf('--- Fin Apartado A ---\n');
end
