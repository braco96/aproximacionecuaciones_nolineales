function gestor_errores(datos, exacta)
    fprintf('\n[TRAZA] --- INICIO GESTOR ERRORES ---\n');
    
    errores = abs(datos.finales - exacta);
    tabla = [datos.n, errores];
    
    fprintf('\n>>> TABLA DE ERRORES ABSOLUTOS\n');
    fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Euler', 'Heun', 'RK4', 'Taylor2');
    fprintf('------------------------------------------------------------------------\n');
    for i = 1:size(tabla,1)
        fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', tabla(i,:));
    end
    
    e_prev = errores(end-1, :);
    e_curr = errores(end, :);
    ordenes = log2(e_prev ./ e_curr);
    
    fprintf('\n>>> ESTIMACIÓN ORDEN CONVERGENCIA (n=320 vs n=640)\n');
    fprintf('Euler (1): %.2f | Heun (2): %.2f | RK4 (4): %.2f | Taylor2 (2): %.2f\n', ordenes);
    fprintf('[TRAZA] --- FIN GESTOR ERRORES ---\n');
end
