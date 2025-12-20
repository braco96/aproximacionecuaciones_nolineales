# Simulador EDO MATLAB - Portafolio Actividad 2

Este repositorio contiene el código fuente que he desarrollado para la Actividad 2 de Ecuaciones Diferenciales Ordinarias (Curso 2025-26). He estructurado el proyecto como una librería modular para facilitar la resolución de los problemas planteados y el análisis de errores.

## Estructura del Proyecto

He organizado mis scripts de la siguiente manera:

* **`lib/`**: Contiene mis implementaciones de los algoritmos numéricos base (`eulerexp`, `rk2`, `rk4`, `taylor2`). No he modificado su lógica interna, actúan como herramientas.
* **`core/`**: Aquí he programado la lógica de automatización. El script `analizar_edo.m` es una función parametrizada que recibe la EDO y un booleano `graficar` para ejecutar todo el análisis solicitado en los apartados A, C y D.
* **`scripts/`**: Son los ejecutables finales (`resolver_problema1.m` y `resolver_problema2.m`). Aquí defino las ecuaciones específicas de cada problema y llamo a las funciones del núcleo.
* **`utils/`**: Herramientas de soporte, como el cálculo simbólico de la solución analítica (Apartado B).

## Cómo ejecutar

Para obtener los resultados del portafolio:

1.  Abre MATLAB y sitúate en la carpeta `scripts/`.
2.  Ejecuta `resolver_problema1` para ver los resultados del P1.
3.  Ejecuta `resolver_problema2` para ver los resultados del P2.

Ambos scripts generarán en la consola la solución analítica, las tablas de errores y, si el parámetro `graficar` está en `true`, abrirán las figuras comparativas.

## Parametrización

He diseñado la función `analizar_edo` para que acepte un argumento booleano:
- `true`: Genera las gráficas de las aproximaciones vs la solución exacta.
- `false`: Solo devuelve las tablas numéricas para optimizar el tiempo de ejecución si no se requiere visualización.

---
*Autor: [Tu Nombre]*
*Grado en Matemáticas - VIU*
