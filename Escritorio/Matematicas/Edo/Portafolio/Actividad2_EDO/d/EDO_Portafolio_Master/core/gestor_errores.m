function gestor_errores(datos, exacta, verbose)
    errores = abs(datos.finales - exacta);
    tabla = [datos.n, errores];
    
    if verbose
        fprintf('\n>>> TABLA DE ERRORES (Apartado C)\n');
        fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Euler', 'Heun', 'RK4', 'Taylor2');
        fprintf('-------|--------------------------------------------------------\n');
        for i = 1:size(tabla,1)
            fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', tabla(i,:));
        end
        
        e_prev = errores(end-1, :); e_curr = errores(end, :);
        ordenes = log2(e_prev ./ e_curr);
        
        fprintf('\n>>> CONVERGENCIA EMPÍRICA (Apartado D)\n');
        fprintf('Método   | EOC Calc | Teórico\n');
        fprintf('---------|----------|--------\n');
        fprintf('Euler    | %-8.2f | 1.0\n', ordenes(1));
        fprintf('Heun     | %-8.2f | 2.0\n', ordenes(2));
        fprintf('RK4      | %-8.2f | 4.0\n', ordenes(3));
        fprintf('Taylor2  | %-8.2f | 2.0\n', ordenes(4));
    end
end
