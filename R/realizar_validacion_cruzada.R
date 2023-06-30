#' Realizar validación cruzada de análisis discriminante lineal
#'
#' Esta función realiza validación cruzada en el conjunto de datos utilizando el método de análisis discriminante lineal (LDA).
#'
#' @param data Un data frame que contiene los datos de entrada.
#' @param variables Un vector de nombres de columna que se utilizarán como variables predictoras.
#'
#' @return Un objeto de modelo de validación cruzada.
#'
realizar_validacion_cruzada <- function(data, variables) {
  set.seed(123)
  cv_modelo <- caret::train(x = data[, variables], y = data$alimentacion, method = "lda", trControl = caret::trainControl(method = "cv"))
  return(cv_modelo)
}
