function gestor_errores(datos, exacta, verbose)
    
    if verbose
        fprintf('\n============================================================\n');
        fprintf(' [APARTADO C] TABLA DE ERRORES ABSOLUTOS\n');
        fprintf('============================================================\n');
        fprintf('Fórmula: Error = | Valor_Aproximado - Valor_Exacto |\n');
    end
    
    errores = abs(datos.finales - exacta);
    tabla = [datos.n, errores];
    
    fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Euler', 'Heun', 'RK4', 'Taylor2');
    fprintf('-------|--------------------------------------------------------\n');
    for i = 1:size(tabla,1)
        fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', tabla(i,:));
    end
    
    if verbose
        fprintf('\n============================================================\n');
        fprintf(' [APARTADO D] ANÁLISIS DE CONVERGENCIA\n');
        fprintf('============================================================\n');
        fprintf('Estimación del orden "p" comparando n=320 vs n=640.\n');
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
    
    if verbose, fprintf('------------------------------------------------------------\n'); end
end
