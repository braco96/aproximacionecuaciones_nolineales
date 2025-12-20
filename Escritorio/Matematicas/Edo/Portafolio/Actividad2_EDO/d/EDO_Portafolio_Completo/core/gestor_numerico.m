function [datos] = gestor_numerico(f, fly, flt, y0, T)
    % Carga dinámica de librerías
    ruta_actual = fileparts(mfilename('fullpath'));
    addpath(fullfile(ruta_actual, '..', 'lib'));

    fprintf('\n------------------------------------------------------------\n');
    fprintf('[TRAZA - NUMÉRICO] Iniciando bucle de aproximaciones...\n');
    fprintf('    >> Métodos: Euler, Heun (RK2), RK4, Taylor2\n');
    
    datos.n = [];
    datos.finales = []; 
    datos.graficos = {}; 
    
    % Bucle solicitado: n = 10 * 2^j para j=0..6
    for j = 0:6
        n = 10 * 2^j;
        fprintf('    [ITERACIÓN j=%d] Ejecutando solvers con n=%d pasos...\n', j, n);
        
        [t, y_eu]  = eulerexp(y0, f, T, n);
        [~, y_he]  = rk2(y0, f, T, n);
        [~, y_rk4] = rk4(y0, f, T, n);
        [~, y_tay] = taylor2(y0, f, fly, flt, T, n);
        
        % Guardamos solo el valor final para la tabla de errores
        datos.n = [datos.n; n];
        datos.finales = [datos.finales; y_eu(end), y_he(end), y_rk4(end), y_tay(end)];
        
        % Si es la iteración más precisa (j=6), guardamos todo para graficar
        if j == 6
            fprintf('    [INFO] Guardando vectores completos de j=6 para graficado...\n');
            datos.graficos.t = t;
            datos.graficos.eu = y_eu;
            datos.graficos.he = y_he;
            datos.graficos.rk4 = y_rk4;
            datos.graficos.tay = y_tay;
        end
    end
    fprintf('[TRAZA - NUMÉRICO] Módulo finalizado.\n');
    fprintf('------------------------------------------------------------\n');
end
