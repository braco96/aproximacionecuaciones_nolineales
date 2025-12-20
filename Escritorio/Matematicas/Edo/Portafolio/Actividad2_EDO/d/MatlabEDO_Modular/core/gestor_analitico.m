function [sol_func, valor_exacto] = gestor_analitico(ode_sym, cond_sym, T)
    % GESTOR_ANALITICO: Resuelve simbólicamente la EDO
    % Muestra la solución general y la particular.
    
    fprintf('\n[TRAZA] --- INICIO MÓDULO ANALÍTICO ---\n');
    
    % 1. Solución General (sin condición inicial)
    fprintf('[INFO] Calculando Solución General...\n');
    sol_general = dsolve(ode_sym);
    fprintf('       >> Famila de curvas: y(t) = %s\n', char(sol_general));
    
    % 2. Solución Particular (con condición inicial)
    fprintf('[INFO] Aplicando condición inicial...\n');
    sol_particular = dsolve(ode_sym, cond_sym);
    fprintf('       >> Solución Particular: y(t) = %s\n', char(sol_particular));
    
    % 3. Conversión a numérica
    sol_func = matlabFunction(sol_particular);
    valor_exacto = sol_func(T);
    
    fprintf('[RESULTADO] Valor exacto en T=%.2f: %.8f\n', T, valor_exacto);
    fprintf('[TRAZA] --- FIN MÓDULO ANALÍTICO ---\n');
end
