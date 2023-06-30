#' Realizar predicción con análisis discriminante
#'
#' Esta función realiza la predicción utilizando un modelo de análisis discriminante entrenado previamente. 
#' Toma como entrada el modelo de análisis discriminante, los datos de entrada y las variables predictoras. 
#' Devuelve las predicciones basadas en el modelo.
#'
#' @param modelo El modelo de análisis discriminante previamente entrenado.
#' @param datos Los datos de entrada utilizados para realizar la predicción.
#' @param variables Un vector con los nombres de las variables predictoras utilizadas para la predicción.
#'
#' @return Un objeto que contiene las predicciones realizadas por el modelo de análisis discriminante.
#'
#' @examples
#' # Cargar datos
#' data <- read.csv("datos.csv")
#' 
#' # Definir variables y clase
#' variables <- c("variable1", "variable2")
#' clase <- "clase"
#' 
#' # Entrenar modelo de análisis discriminante
#' modelo <- analisis_discriminante_csv(data, clase, variables)
#' 
#' # Realizar predicción
#' prediccion <- realizar_prediccion(modelo, data, variables)
#' print(prediccion)
#'
#' @export
modelo <- analisis_discriminante_csv(data, clase, variables)
prediccion <- predict(modelo, newdata = datos[, variables])
print(prediccion)

devtools::document()
