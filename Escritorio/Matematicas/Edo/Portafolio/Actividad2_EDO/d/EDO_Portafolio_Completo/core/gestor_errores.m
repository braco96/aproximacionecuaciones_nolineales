function gestor_errores(datos, exacta)
    fprintf('\n------------------------------------------------------------\n');
    fprintf('[TRAZA - ERRORES] Calculando errores absolutos y EOC...\n');
    
    % Apartado C: Tabla de Errores
    errores = abs(datos.finales - exacta);
    tabla = [datos.n, errores];
    
    fprintf('\n>>> TABLA APARTADO C: Errores Absolutos en T\n');
    fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Euler', 'Heun', 'RK4', 'Taylor2');
    fprintf('-------|--------------------------------------------------------\n');
    for i = 1:size(tabla,1)
        fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', ...
            tabla(i,1), tabla(i,2), tabla(i,3), tabla(i,4), tabla(i,5));
    end
    
    % Apartado D: Orden de Convergencia Empírico (EOC)
    % Formula: log2( Error(n_prev) / Error(n_curr) )
    e_prev = errores(end-1, :);
    e_curr = errores(end, :);
    ordenes = log2(e_prev ./ e_curr);
    
    fprintf('\n>>> TABLA APARTADO D: Convergencia Empírica (n=320 vs n=640)\n');
    fprintf('Método   | EOC Calculado | Orden Teórico Esperado\n');
    fprintf('---------|---------------|-----------------------\n');
    fprintf('Euler    | %-13.4f | 1.0\n', ordenes(1));
    fprintf('Heun     | %-13.4f | 2.0\n', ordenes(2));
    fprintf('RK4      | %-13.4f | 4.0\n', ordenes(3));
    fprintf('Taylor2  | %-13.4f | 2.0\n', ordenes(4));
    
    fprintf('[TRAZA - ERRORES] Análisis completado.\n');
    fprintf('------------------------------------------------------------\n');
end
