#paqueteria necesaria
library(MASS)
library(readxl)
library(ggplot2)
library(caret)
library(gridExtra)
library(lattice)
library(utils)


leche <- ("~/Amor/R/VarDis/Data/datos_produccion_leche.csv")
data <- utils::read.csv(leche)
data
#funcion para analisis discriminante desde archivo csv
analisis_discriminante_csv <- function(data, clase, variables) {
  clase <- data[,clase]
  predictores <- data[, variables, drop=FALSE]
  modelo <- MASS::lda(predictores, clase)
  return(modelo)
}

#ruta del archivo y nombre de la columna a utilizar como variable de clase
leche2 <- normalizePath("~/Amor/R/VarDis/Data/datos_produccion_leche.csv")
datos <- read.csv(leche2)
datos
data <- datos
clase <- "alimentacion"
variables <- c("consumo_diario", "tiempo_ordeño")

#prediccion de modelo
modelo <- analisis_discriminante_csv(data, clase, variables)
prediccion <- predict(modelo, newdata = datos[, variables])
print(prediccion)

# Realizar validación cruzada
set.seed(123)
cv_modelo <- train(x = data[, variables], y = data$alimentacion, method = "lda", trControl = trainControl(method = "cv"))
print(cv_modelo)

# Obtener los niveles únicos de la variable de clase
clase_niveles <- levels(data$alimentacion)
conf_mat <- table(prediccion$class, data$alimentacion)
colnames(conf_mat) <- clase_niveles
rownames(conf_mat) <- clase_niveles
print(conf_mat)


# Crear la matriz de confusión y Calcular medidas de precisión
conf_mat <- table(prediccion$class, data$alimentacion)
accuracy <- sum(diag(conf_mat)) / sum(conf_mat)
sensitivity <- conf_mat[1,1] / sum(conf_mat[1,])
specificity <- conf_mat[2,2] / sum(conf_mat[2,])
precision <- conf_mat[1,1] / sum(conf_mat[,1])
recall <- sensitivity
print(conf_mat)
cat_acc <- data.frame(accuracy, sensitivity, specificity, precision, recall)
print(cat_acc)
#Crear diagrama de dispersión con funciones discriminantes como ejes
lda_scores <- predict(modelo, newdata = data[, c("consumo_diario", "tiempo_ordeño")])$x
ggplot(data, aes(x = lda_scores[,1], y = lda_scores[,2], color = alimentacion)) +
  geom_point()
labs(title = "Análisis Discriminante",
     x = "LD1",
     y = "LD2",
     color = "Clase predicha")
