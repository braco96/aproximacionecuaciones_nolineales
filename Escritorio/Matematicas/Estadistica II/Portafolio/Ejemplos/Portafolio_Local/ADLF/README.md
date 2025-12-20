# Proyecto: ADLF

## 👤 Autoría
* **Refactorización:** Luis Bravo Collado
* **Base Teórica:** Inma Garcés Andrés (Estadística II)

## 📚 Fundamentación Teórica: Análisis Discriminante Lineal
Técnica para clasificar observaciones en grupos predefinidos buscando la combinación lineal que mejor los separa.

### 1. El Criterio de Fisher
Maximizar el cociente entre varianza "entre grupos" y "intra grupos":
$$ \text{max } \frac{a'Ba}{a'Wa} $$

### 2. Regla de Clasificación
Bajo supuestos de normalidad y homocedasticidad ($\Sigma_1 = \Sigma_2$), la función discriminante es:
$$ L(x) = (x - \bar{x})' S_{pooled}^{-1} (\bar{x}_1 - \bar{x}_2) $$

## 💻 Sobre el Código
Se utiliza `MASS::lda` para calcular las probabilidades a posteriori y visualizar las fronteras de decisión.
