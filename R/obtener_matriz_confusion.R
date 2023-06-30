#' Obtener la matriz de confusión
#'
#' Esta función crea la matriz de confusión a partir de las predicciones y las clases reales.
#'
#' @param prediccion Un vector de predicciones obtenido a partir del modelo.
#' @param clase Un vector que contiene las clases reales de los datos.
#'
#' @return Una matriz de confusión.
#'
obtener_matriz_confusion <- function(prediccion, clase) {
  conf_mat <- table(prediccion, clase)
  return(conf_mat)
}
