function [sol_func, valor_exacto] = gestor_analitico(ode_sym, cond_sym, T, verbose)
    
    if verbose
        fprintf('\n============================================================\n');
        fprintf(' APARTADO B: CÁLCULO DE LA SOLUCIÓN ANALÍTICA\n');
        fprintf('============================================================\n');
        fprintf('Enunciado: Calcula la solución analítica de los problemas.\n');
        fprintf('Metodología: Usamos cálculo simbólico (dsolve) para hallar la familia de curvas y la solución particular.\n\n');
    end
    
    % 1. Solución General
    if verbose, fprintf('   [PASO 1] Hallando Solución General (Familia de curvas)...\n'); end
    sol_general = dsolve(ode_sym);
    
    if verbose, fprintf('      >> Resultado General: y(t) = %s\n\n', char(sol_general)); end
    
    % 2. Solución Particular
    if verbose, fprintf('   [PASO 2] Aplicando condición inicial para hallar la Solución Particular...\n'); end
    sol_particular = dsolve(ode_sym, cond_sym);
    
    if verbose
        fprintf('      >> Solución Particular: y(t) = %s\n\n', char(sol_particular));
        fprintf('   [PASO 3] Evaluando solución exacta en T = %.2f...\n', T);
    end
    
    % 3. Valor numérico
    sol_func = matlabFunction(sol_particular);
    valor_exacto = sol_func(T);
    
    if verbose
        fprintf('      >> Valor Exacto calculado: %.10f\n', valor_exacto);
        fprintf('--- Fin Apartado B ---\n');
    end
end
