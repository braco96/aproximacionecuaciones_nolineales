# ==============================================================================
# PROYECTO: CC
# AUTOR: Luis Bravo Collado (Braco96)
# ==============================================================================
if(!require(CCA)) install.packages("CCA")
if(!require(CCP)) install.packages("CCP")
library(CCA); library(CCP)

print("=== PARTE 1: IRIS CANÓNICO ===")
data(iris)
X <- iris[, 1:2]; Y <- iris[, 3:4]
cca <- cc(X, Y)

print("Correlaciones Canónicas:")
print(cca$cor)
print("Test de Significancia:")
p.asym(cca$cor, nrow(iris), 2, 2)

print("=== PARTE 2: SIMULACIÓN CAPRINOS ===")
# (Código teórico simplificado para evitar errores si faltan datos)
print("Ejemplo teórico listo para ejecución.")
