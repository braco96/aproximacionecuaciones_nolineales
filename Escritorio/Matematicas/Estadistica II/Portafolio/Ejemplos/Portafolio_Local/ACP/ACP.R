# ==============================================================================
# PROYECTO: ACP
# AUTOR: Luis Bravo Collado (Braco96)
# ==============================================================================

if(!require(pacman)) install.packages("pacman")
pacman::p_load(ggplot2, GGally, ggfortify, install = FALSE)

# Función auxiliar para cargar datos
cargar_datos <- function(nombre) {
  rutas <- c(nombre, file.path("ACP", nombre), file.path("Datos", nombre))
  for(r in rutas) {
    if(file.exists(r)) { load(r, .GlobalEnv); return(TRUE) }
  }
  return(FALSE)
}

print("=== PARTE 1: SIMULACIÓN ===")
set.seed(21121)
dat.t1 <- data.frame(x1=rnorm(100), x2=rnorm(100, sd=2), x3=rnorm(100, sd=0.5))

print("Matriz de Covarianzas:")
print(cov(dat.t1))
acp1 <- princomp(dat.t1, cor = FALSE)
print(summary(acp1))
print(acp1$loadings)

print("=== PARTE 2: MORTALIDAD ===")
if(cargar_datos("datos_prac2.RData") && exists("dat.t2")) {
  cols <- c("todoH", "todoM", "digH", "digM", "respH", "respM", "cardvH", "cardvM", 
            "maligH", "maligM", "cerebvH", "cerebvM", "isquemcH", "isquemcM", "diabH", "diabM")
  colnames(dat.t2)[5:20] <- cols
  
  acp2c <- princomp(dat.t2[, 5:20], cor = TRUE)
  print("Resumen ACP Mortalidad:")
  print(summary(acp2c))
  print(acp2c$loadings[, 1:2])
} else { warning("No se encontró datos_prac2.RData") }

print("=== PARTE 3: EPF ===")
if(cargar_datos("EPF2.RData") && exists("EPF")) {
  acp3 <- princomp(EPF[, -1], cor = FALSE)
  print("Resumen ACP EPF:")
  print(summary(acp3))
} else { warning("No se encontró EPF2.RData") }
