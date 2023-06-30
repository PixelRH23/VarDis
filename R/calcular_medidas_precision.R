#' Calcular medidas de precisión
#'
#' Esta función calcula medidas de precisión como la exactitud, sensibilidad, especificidad, precisión y recall a partir de una matriz de confusión.
#'
#' @param conf_mat Una matriz de confusión.
#'
#' @return Un data frame con las medidas de precisión.
#'
calcular_medidas_precision <- function(conf_mat) {
  accuracy <- sum(diag(conf_mat)) / sum(conf_mat)
  sensitivity <- conf_mat[1, 1] / sum(conf_mat[1, ])
  specificity <- conf_mat[2, 2] / sum(conf_mat[2, ])
  precision <- conf_mat[1, 1] / sum(conf_mat[, 1])
  recall <- sensitivity
  cat_acc <- data.frame(accuracy, sensitivity, specificity, precision, recall)
  return(cat_acc)
}
