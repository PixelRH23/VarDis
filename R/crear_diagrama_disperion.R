#' Crear un diagrama de dispersión basado en análisis discriminante lineal
#'
#' Esta función crea un diagrama de dispersión utilizando las funciones discriminantes como ejes.
#'
#' @param data Un data frame que contiene los datos de entrada.
#' @param variables Un vector de nombres de columna que se utilizarán como variables predictoras en el modelo LDA.
#'
crear_diagrama_disperion <- function(data, variables) {
  modelo <- realizar_analisis_discriminante(data, "alimentacion", variables)
  lda_scores <- predict(modelo, newdata = data[, variables])$x
  ggplot2::ggplot(data, aes(x = lda_scores[, 1], y = lda_scores[, 2], color = alimentacion)) +
    ggplot2::geom_point() +
    ggplot2::labs(title = "Análisis Discriminante",
                  x = "LD1",
                  y = "LD2",
                  color = "Clase predicha")
}
