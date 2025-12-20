function [sol_func, valor_exacto] = gestor_analitico(ode_sym, cond_sym, T, verbose)
    if verbose
        fprintf('\n------------------------------------------------------------\n');
        fprintf('[TRAZA - ANALÍTICO] Resolviendo EDO simbólicamente...\n');
    end
    
    % Solución General
    sol_general = dsolve(ode_sym);
    if verbose, fprintf('   [PASO 1] Solución General: y(t) = %s\n', char(sol_general)); end
    
    % Solución Particular
    sol_particular = dsolve(ode_sym, cond_sym);
    if verbose, fprintf('   [PASO 2] Solución Particular: y(t) = %s\n', char(sol_particular)); end
    
    % Valor Numérico
    sol_func = matlabFunction(sol_particular);
    valor_exacto = sol_func(T);
    
    if verbose
        fprintf('   [RESULTADO] Valor Exacto en T=%.2f: %.12f\n', T, valor_exacto);
        fprintf('------------------------------------------------------------\n');
    end
end
