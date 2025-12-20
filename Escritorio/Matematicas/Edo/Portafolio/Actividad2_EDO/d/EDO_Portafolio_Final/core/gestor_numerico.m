function [datos] = gestor_numerico(f, fly, flt, y0, T)
    % Aseguramos que se cargue la librería lib desde aquí
    ruta_actual = fileparts(mfilename('fullpath'));
    addpath(fullfile(ruta_actual, '..', 'lib'));

    fprintf('\n[TRAZA] --- INICIO GESTOR NUMÉRICO ---\n');
    
    datos.n = [];
    datos.finales = []; 
    datos.graficos = {}; 
    
    for j = 0:6
        n = 10 * 2^j;
        fprintf('   [CALCULANDO] Iteración j=%d (n=%d pasos)...\n', j, n);
        
        [t, y_eu]  = eulerexp(y0, f, T, n);
        [~, y_he]  = rk2(y0, f, T, n);
        [~, y_rk4] = rk4(y0, f, T, n);
        [~, y_tay] = taylor2(y0, f, fly, flt, T, n);
        
        datos.n = [datos.n; n];
        datos.finales = [datos.finales; y_eu(end), y_he(end), y_rk4(end), y_tay(end)];
        
        if j == 6
            datos.graficos.t = t;
            datos.graficos.eu = y_eu;
            datos.graficos.he = y_he;
            datos.graficos.rk4 = y_rk4;
            datos.graficos.tay = y_tay;
        end
    end
    fprintf('[TRAZA] --- FIN GESTOR NUMÉRICO ---\n');
end
