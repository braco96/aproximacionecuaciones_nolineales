# Proyecto: CC

## 👤 Autoría
* **Refactorización:** Luis Bravo Collado
* **Base Teórica:** Inma Garcés Andrés (Estadística II)

## 📚 Fundamentación Teórica: Correlación Canónica
Estudio de la relación entre dos conjuntos de variables $X$ e $Y$.

### 1. Objetivo
Encontrar combinaciones lineales $U = a'X$ y $V = b'Y$ tal que su correlación sea máxima:
$$ \rho = \text{Corr}(U, V) $$

### 2. Solución
Los vectores $a$ y $b$ son los vectores propios asociados a las matrices de covarianza particionadas.

## 💻 Sobre el Código
El script utiliza el paquete `CCA` para calcular los coeficientes canónicos y realizar el test de Wilks.
