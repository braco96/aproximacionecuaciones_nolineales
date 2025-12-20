# Suite de Resolución EDO - Portafolio Actividad 2

Este proyecto implementa una solución modular y trazable para resolver Ecuaciones Diferenciales Ordinarias mediante métodos numéricos y simbólicos en MATLAB.

## Estructura del Proyecto

* **`lib/`**: Motores de cálculo matemático puro.
    * `eulerexp.m`, `rk2.m` (Heun), `rk4.m`, `taylor2.m`.
* **`core/`**: Gestores de lógica y trazabilidad.
    * `gestor_analitico.m`: Calcula y muestra la **solución general** y particular.
    * `gestor_numerico.m`: Ejecuta los bucles de aproximación ($n=10 \cdot 2^j$).
    * `gestor_errores.m`: Genera tablas de error absoluto y convergencia empírica.
    * `gestor_grafico.m`: Genera las comparativas visuales.
* **`scripts/`**: Archivos de ejecución principal.
    * `main_problema1.m` y `main_problema2.m`.

## Características Clave

1.  **Trazabilidad:** La ejecución muestra en consola paso a paso qué está ocurriendo (cálculo simbólico, iteraciones numéricas, análisis de error).
2.  **Solución General:** El gestor analítico resuelve explícitamente la familia de curvas antes de aplicar el PVI.
3.  **Robustez:** Los scripts utilizan rutas absolutas dinámicas para evitar errores de *path* en MATLAB.

## Instrucciones de Uso

1.  Abre MATLAB.
2.  Navega a la carpeta \`scripts/\` dentro de este proyecto.
3.  Ejecuta \`main_problema1\` o \`main_problema2\`.
