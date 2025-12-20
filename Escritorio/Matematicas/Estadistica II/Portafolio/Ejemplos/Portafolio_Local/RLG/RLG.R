# ==============================================================================
# PROYECTO: RLG
# AUTOR: Luis Bravo Collado (Braco96)
# ==============================================================================

# Función para buscar beetles.Rdata donde sea
cargar_beetles <- function() {
  rutas <- c("beetles.Rdata", "RLG/beetles.Rdata", "../beetles.Rdata")
  for(r in rutas) {
    if(file.exists(r)) { 
      print(paste("Cargando datos desde:", r))
      load(r, .GlobalEnv)
      return(TRUE)
    }
  }
  return(FALSE)
}

print("=== PARTE 1: CASO PRÁCTICO (BEETLES) ===")
if(cargar_beetles() && exists("beetles")) {
  beetles$piperonyl <- as.factor(beetles$piperonyl)
  
  # Modelo 1
  m1 <- glm(cbind(muertos, expuestos-muertos) ~ pyrethrin + piperonyl, 
            family=binomial(logit), data=beetles)
  print("--- Resumen Modelo 1 ---")
  print(summary(m1))
  print("--- Odds Ratios ---")
  print(exp(coef(m1)))

  # Modelo 2 (Interacción)
  m2 <- glm(cbind(muertos, expuestos-muertos) ~ pyrethrin * piperonyl, 
            family=binomial(logit), data=beetles)
  print("--- Comparación de Modelos (ANOVA) ---")
  print(anova(m1, m2, test="Chisq"))
} else {
  print("⚠️ AVISO: No se encontró 'beetles.Rdata'. Saltando Parte 1.")
}

print("=== PARTE 2: ANEXO TEÓRICO (DOBSON) ===")
dose <- c(1.69, 1.72, 1.75, 1.78, 1.81, 1.83, 1.86, 1.88)
killed <- c(6, 13, 18, 28, 52, 53, 61, 60)
n <- c(59, 60, 62, 56, 63, 59, 62, 60)
df_t <- data.frame(dose, killed, n)

mod_t <- glm(cbind(killed, n-killed) ~ dose, family=binomial, data=df_t)
print("--- Resumen Modelo Teórico ---")
print(summary(mod_t))
