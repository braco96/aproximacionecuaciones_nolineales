function [sol_func, valor_exacto] = gestor_analitico(ode_sym, cond_sym, T)
    fprintf('\n------------------------------------------------------------\n');
    fprintf('[TRAZA - ANALÍTICO] Iniciando resolución simbólica...\n');
    
    % 1. Solución General (Familia de curvas)
    fprintf('[PASO 1] Buscando Solución General (constante C)...\n');
    sol_general = dsolve(ode_sym);
    fprintf('    >> Resultado General: y(t) = %s\n', char(sol_general));
    
    % 2. Solución Particular (Problema de Valor Inicial)
    fprintf('[PASO 2] Aplicando condición inicial para hallar C...\n');
    sol_particular = dsolve(ode_sym, cond_sym);
    fprintf('    >> Solución Particular: y(t) = %s\n', char(sol_particular));
    
    % 3. Evaluación Numérica
    fprintf('[PASO 3] Evaluando en T = %.2f...\n', T);
    sol_func = matlabFunction(sol_particular);
    valor_exacto = sol_func(T);
    
    fprintf('    >> Valor Exacto en T=%.2f: %.10f\n', T, valor_exacto);
    fprintf('[TRAZA - ANALÍTICO] Módulo finalizado.\n');
    fprintf('------------------------------------------------------------\n');
end
