#' Realizar análisis discriminante lineal desde un archivo CSV
#'
#' Esta función realiza un análisis discriminante lineal (LDA) utilizando los datos proporcionados en un archivo CSV.
#'
#' @param data Un data frame que contiene los datos del archivo CSV.
#' @param clase El nombre de la columna que se utilizará como variable de clase.
#' @param variables Un vector de nombres de columna que se utilizarán como variables predictoras.
#'
#' @return Un objeto de modelo LDA.
#'
analisis_discriminante_csv <- function(data, clase, variables) {
  clase <- data[,clase]
  predictores <- data[, variables, drop=FALSE]
  modelo <- MASS::lda(predictores, clase)
  return(modelo)
}
