function apartado_d(tabla_errores)
    fprintf('\n--- [Apartado D] Análisis de Convergencia ---\n');
    
    err_matrix = tabla_errores(:, 2:5);
    
    % Comparamos la penúltima (n=320) con la última iteración (n=640)
    err_prev = err_matrix(end-1, :);
    err_curr = err_matrix(end, :);
    
    % Fórmula de convergencia empírica: p = log2(Error_prev / Error_curr)
    ordenes = log2(err_prev ./ err_curr);
    
    fprintf('Órdenes estimados (Esperados: Euler=1, Heun=2, RK4=4, Taylor=2):\n');
    fprintf('Euler:   %.2f\n', ordenes(1));
    fprintf('Heun:    %.2f\n', ordenes(2));
    fprintf('RK4:     %.2f\n', ordenes(3));
    fprintf('Taylor2: %.2f\n', ordenes(4));
end
