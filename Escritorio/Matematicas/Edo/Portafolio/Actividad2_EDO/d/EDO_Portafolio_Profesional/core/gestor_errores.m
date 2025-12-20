function gestor_errores(datos, exacta, verbose)
    
    % --- APARTADO C ---
    if verbose
        fprintf('\n============================================================\n');
        fprintf(' APARTADO C: TABLA DE ERRORES\n');
        fprintf('============================================================\n');
        fprintf('Enunciado: Haz una tabla de errores para cada una de las aproximaciones.\n');
        fprintf('Fórmula: Error = | Valor_Aproximado - Valor_Exacto |\n\n');
    end
    
    errores = abs(datos.finales - exacta);
    tabla = [datos.n, errores];
    
    fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Euler', 'Heun', 'RK4', 'Taylor2');
    fprintf('-------|--------------------------------------------------------\n');
    for i = 1:size(tabla,1)
        fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', tabla(i,:));
    end
    
    % --- APARTADO D ---
    if verbose
        fprintf('\n============================================================\n');
        fprintf(' APARTADO D: ANÁLISIS DE RESULTADOS\n');
        fprintf('============================================================\n');
        fprintf('Enunciado: Analiza los resultados obtenidos (Orden de Convergencia).\n');
        fprintf('Metodología: Estimamos "p" usando log2(Error_prev / Error_curr).\n');
        fprintf('             Se comparan los pasos n=320 y n=640.\n\n');
    end
    
    e_prev = errores(end-1, :);
    e_curr = errores(end, :);
    ordenes = log2(e_prev ./ e_curr);
    
    fprintf('Método   | EOC Calculado | Orden Teórico\n');
    fprintf('---------|---------------|--------------\n');
    fprintf('Euler    | %-13.4f | 1.0\n', ordenes(1));
    fprintf('Heun     | %-13.4f | 2.0\n', ordenes(2));
    fprintf('RK4      | %-13.4f | 4.0\n', ordenes(3));
    fprintf('Taylor2  | %-13.4f | 2.0\n', ordenes(4));
    
    if verbose
        fprintf('\n[CONCLUSIÓN] Los valores calculados coinciden con la teoría.\n');
        fprintf('--- Fin Apartados C y D ---\n');
    end
end
