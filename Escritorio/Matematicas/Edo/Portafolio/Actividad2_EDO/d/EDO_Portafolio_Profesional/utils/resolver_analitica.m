function [sol_func, sol_texto] = resolver_analitica(ecuacion_sym, cond_sym)
    % Resuelve simbólicamente y devuelve handle numérico y string
    sol_sym = dsolve(ecuacion_sym, cond_sym);
    sol_func = matlabFunction(sol_sym);
    sol_texto = char(sol_sym);
    
    fprintf('   [Analítica] Solución hallada: y(t) = %s\n', sol_texto);
end
