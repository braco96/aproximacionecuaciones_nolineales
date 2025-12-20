# Portafolio EDO - Solución Explicada y Trazable

Este proyecto resuelve los Problemas 1 y 2 de la Actividad 2, proporcionando trazas detalladas de cada paso matemático.

## Estructura Modular

1.  **`lib/`**: Motores de cálculo (Euler, RK4, etc). Son puros y matemáticos.
2.  **`core/`**: Gestores que contienen la lógica de los apartados del PDF.
    * `gestor_analitico.m` (Apartado B): Muestra solución general y particular.
    * `gestor_numerico.m` (Apartado A): Ejecuta los métodos y explica las fórmulas si `verbose=true`.
    * `gestor_errores.m` (Apartados C y D): Genera tablas y conclusiones.
3.  **`scripts/`**: Archivos de entrada (`main_problema1.m`).

## Uso del parámetro VERBOSE

En los scripts principales, verás:
\`\`\`matlab
VERBOSE = true;
\`\`\`
- **true**: Muestra explicaciones teóricas, fórmulas empleadas, pasos intermedios y enunciados de los apartados.
- **false**: Muestra solo los resultados numéricos finales para una lectura rápida.

## Ejecución
1. Abre MATLAB.
2. Navega a `scripts/`.
3. Ejecuta `main_problema1` o `main_problema2`.
