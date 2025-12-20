function [sol_func, valor_exacto] = gestor_analitico(ode_sym, cond_sym, T)
    fprintf('\n[TRAZA] --- INICIO GESTOR ANALÍTICO ---\n');
    
    % 1. Solución General
    sol_general = dsolve(ode_sym);
    fprintf('   [INFO] Solución General (Familia): y(t) = %s\n', char(sol_general));
    
    % 2. Solución Particular
    sol_particular = dsolve(ode_sym, cond_sym);
    fprintf('   [INFO] Solución Particular (PVI):  y(t) = %s\n', char(sol_particular));
    
    % 3. Valor numérico
    sol_func = matlabFunction(sol_particular);
    valor_exacto = sol_func(T);
    
    fprintf('   [RESULTADO] Valor exacto en t=%.2f: %.8f\n', T, valor_exacto);
    fprintf('[TRAZA] --- FIN GESTOR ANALÍTICO ---\n');
end
