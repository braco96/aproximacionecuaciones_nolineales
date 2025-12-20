# Portafolio EDO - Solución Explicada y Trazable

Este proyecto resuelve los Problemas 1 y 2 de la Actividad 2, proporcionando trazas detalladas de cada paso matemático y gráficas comparativas.

## Estructura Modular

* **`lib/`**: Motores de cálculo (Euler, RK4, etc). Son puros y matemáticos.
* **`core/`**: Gestores que contienen la lógica de los apartados del PDF.
    * `gestor_analitico.m`: Calcula Solución General y Particular (Apartado B).
    * `gestor_numerico.m`: Ejecuta los métodos y explica los pasos (Apartado A).
    * `gestor_errores.m`: Genera tablas y conclusiones (Apartados C y D).
    * `gestor_grafico.m`: Traza las 4 aproximaciones vs la exacta.
* **`scripts/`**: Archivos de ejecución (`main_problema1.m`).

## Ejecución
1. Abre MATLAB.
2. Navega a `scripts/`.
3. Ejecuta `main_problema1` o `main_problema2`.
