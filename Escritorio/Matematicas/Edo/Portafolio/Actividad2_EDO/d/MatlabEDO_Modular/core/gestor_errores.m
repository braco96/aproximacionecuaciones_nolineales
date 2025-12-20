function gestor_errores(datos_numericos, valor_exacto)
    % GESTOR_ERRORES: Calcula errores absolutos y órdenes de convergencia
    
    fprintf('\n[TRAZA] --- INICIO ANÁLISIS DE ERRORES ---\n');
    
    % 1. Tabla de Errores
    errores = abs(datos_numericos.finales - valor_exacto);
    tabla = [datos_numericos.n, errores];
    
    fprintf('\n>>> TABLA DE ERRORES ABSOLUTOS (Apartado C)\n');
    fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Euler', 'Heun', 'RK4', 'Taylor2');
    fprintf('------------------------------------------------------------------------\n');
    for i = 1:size(tabla, 1)
        fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', ...
            tabla(i,1), tabla(i,2), tabla(i,3), tabla(i,4), tabla(i,5));
    end
    
    % 2. Órdenes de Convergencia
    fprintf('\n>>> ESTIMACIÓN DE CONVERGENCIA (Apartado D)\n');
    % EOC = log2( Error_prev / Error_curr )
    e_prev = errores(end-1, :);
    e_curr = errores(end, :);
    ordenes = log2(e_prev ./ e_curr);
    
    fprintf('Método   | Orden Calculado | Orden Teórico\n');
    fprintf('------------------------------------------\n');
    fprintf('Euler    | %.2f            | 1.00\n', ordenes(1));
    fprintf('Heun     | %.2f            | 2.00\n', ordenes(2));
    fprintf('RK4      | %.2f            | 4.00\n', ordenes(3));
    fprintf('Taylor2  | %.2f            | 2.00\n', ordenes(4));
    
    fprintf('[TRAZA] --- FIN ANÁLISIS DE ERRORES ---\n');
end
