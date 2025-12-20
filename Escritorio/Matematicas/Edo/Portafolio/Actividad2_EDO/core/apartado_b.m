function [valor_exacto] = apartado_b(ode_sym, cond_sym, T, graficar)
    fprintf('\n--- [Apartado B] Calculando Solución Analítica ---\n');
    
    sol_sym = dsolve(ode_sym, cond_sym);
    sol_func = matlabFunction(sol_sym);
    valor_exacto = sol_func(T);
    
    fprintf('Fórmula hallada: y(t) = %s\n', char(sol_sym));
    fprintf('Valor exacto en T=%.2f: %.8f\n', T, valor_exacto);
    
    if graficar
        % Busca la figura activa creada en Apartado A y añade la solución exacta
        fig_handles = get(0,'Children');
        if ~isempty(fig_handles)
            figure(fig_handles(1)); hold on;
            fplot(sol_func, [0 T], 'k-', 'LineWidth', 2, 'DisplayName', 'Exacta');
            legend('show'); hold off;
        end
    end
end
