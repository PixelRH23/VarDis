% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prediccion_modelo.R
\docType{data}
\name{modelo}
\alias{modelo}
\title{Realizar predicción con análisis discriminante}
\format{
An object of class \code{lda} of length 8.
}
\usage{
modelo
}
\arguments{
\item{modelo}{El modelo de análisis discriminante previamente entrenado.}

\item{datos}{Los datos de entrada utilizados para realizar la predicción.}

\item{variables}{Un vector con los nombres de las variables predictoras utilizadas para la predicción.}
}
\value{
Un objeto que contiene las predicciones realizadas por el modelo de análisis discriminante.
}
\description{
Esta función realiza la predicción utilizando un modelo de análisis discriminante entrenado previamente.
Toma como entrada el modelo de análisis discriminante, los datos de entrada y las variables predictoras.
Devuelve las predicciones basadas en el modelo.
}
\examples{
# Cargar datos
data <- read.csv("datos.csv")

# Definir variables y clase
variables <- c("variable1", "variable2")
clase <- "clase"

# Entrenar modelo de análisis discriminante
modelo <- analisis_discriminante_csv(data, clase, variables)

# Realizar predicción
prediccion <- realizar_prediccion(modelo, data, variables)
print(prediccion)

}
\keyword{datasets}
