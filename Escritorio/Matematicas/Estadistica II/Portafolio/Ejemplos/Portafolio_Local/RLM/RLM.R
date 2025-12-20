# ==============================================================================
# PROYECTO: RLM
# AUTOR: Luis Bravo Collado (Braco96)
# ==============================================================================
if(!require(lmtest)) install.packages("lmtest")
if(!require(car)) install.packages("car")
library(lmtest); library(car)

# Buscar Species.Rdata
cargar_species <- function() {
  rutas <- c("Species.Rdata", "RLM/Species.Rdata")
  for(r in rutas) {
    if(file.exists(r)) { load(r, .GlobalEnv); return(TRUE) }
  }
  return(FALSE)
}

print("=== PARTE 1: SPECIES ===")
if(cargar_species() && exists("Species")) {
  m_step <- step(lm(NumSpecies ~ ., data=Species[, -1]), trace=0)
  print("--- Modelo Stepwise ---")
  print(summary(m_step))
  
  print("--- Test Shapiro ---")
  print(shapiro.test(residuals(m_step)))
  print("--- Test Breusch-Pagan ---")
  print(bptest(m_step))
} else {
  print("⚠️ No se encontró 'Species.Rdata'")
}

print("=== PARTE 2: ANEXO TEÓRICO (PAPEL) ===")
df_sim <- data.frame(R=c(160,171,175), M=c(10,15,15), T=c(150,180,150))
m_sim <- lm(R ~ M + T, data=df_sim)
print(summary(m_sim))
