function [tabla_errores] = apartado_c(datos_A, valor_exacto_B)
    fprintf('\n--- [Apartado C] Generando Tabla de Errores ---\n');
    
    errores_abs = abs(datos_A.finals - valor_exacto_B);
    tabla_errores = [datos_A.n_vals, errores_abs];
    
    fprintf('%-6s | %-12s %-12s %-12s %-12s\n', 'n', 'Err Euler', 'Err Heun', 'Err RK4', 'Err Taylor');
    fprintf('------------------------------------------------------------------------\n');
    for i = 1:size(tabla_errores, 1)
        fprintf('%-6d | %-12.2e %-12.2e %-12.2e %-12.2e\n', ...
            tabla_errores(i,1), tabla_errores(i,2), tabla_errores(i,3), tabla_errores(i,4), tabla_errores(i,5));
    end
end
