# ==============================================================================
# PROYECTO: ADLF
# AUTOR: Luis Bravo Collado (Braco96)
# ==============================================================================
if(!require(MASS)) install.packages("MASS")
if(!require(gmodels)) install.packages("gmodels")
library(MASS); library(gmodels)

print("=== PARTE 1: IRIS ===")
data(iris)
fit4 <- lda(data = iris, Species ~ .)
print("Matriz de Confusión (Iris Completo):")
pred <- predict(fit4)$class
CrossTable(iris$Species, pred, prop.c=FALSE, prop.chisq=FALSE, prop.t=FALSE)

print("=== PARTE 2: SIMULACIÓN MYTILICOLA ===")
set.seed(123)
g1 <- mvrnorm(76, mu = c(219, 138), Sigma = matrix(c(306, -1, -1, 210), 2))
g2 <- mvrnorm(91, mu = c(241, 147), Sigma = matrix(c(306, -1, -1, 210), 2))
datos <- rbind(data.frame(g1, grupo="G1"), data.frame(g2, grupo="G2"))
colnames(datos)[1:2] <- c("L", "A")

modelo_sim <- lda(grupo ~ L + A, data = datos)
print("Modelo Simulado:")
print(modelo_sim)
