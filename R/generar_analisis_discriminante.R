#' Función principal para el análisis discriminante y la generación de gráficos
#'
#' Esta función principal carga los paquetes necesarios, lee los datos del archivo CSV, realiza el análisis discriminante, la validación cruzada y genera gráficos.
#'
#' @param archivo_csv La ruta del archivo CSV que contiene los datos de entrada.
#' @param variables Un vector de nombres de columna que se utilizarán como variables predictoras en el análisis.
#'
#' @return Una lista con los objetos de modelo, predicciones, modelo de validación cruzada y medidas de precisión.
#'
generar_analisis_discriminante <- function(archivo_csv, variables) {
  if (!file.exists(archivo_csv)) {
    stop("El archivo especificado no existe.")
  }

  datos <- readxl::read_csv(archivo_csv)

  modelo <- realizar_analisis_discriminante(datos, "alimentacion", variables)
  prediccion <- predict(modelo, newdata = datos[, variables])

  cv_modelo <- realizar_validacion_cruzada(datos, variables)

  conf_mat <- obtener_matriz_confusion(prediccion$class, datos$alimentacion)
  medidas_precision <- calcular_medidas_precision(conf_mat)

  crear_diagrama_disperion(datos, variables)

  return(list(modelo = modelo, prediccion = prediccion, cv_modelo = cv_modelo, medidas_precision = medidas_precision))
}
