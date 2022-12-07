# ///////////////////////////////////////////////////////////////////////////
# Sesion 02 - Ciencia de datos con R

#install.packages("nycflights13")
#install.packages("tidyverse")
#install.packages("knitr")

library(nycflights13)
library(tidyverse)
library(knitr)



##########
# Visualizamos toda la tabla
 View(flights)


##########
# Visualizamos la estructura de la tabla
  glimpse(flights)
        # Muestra el tipo de dato de cada columna (int, nu, chr,...)
        # Es de tidyverse


##########
# Creamos un mejor formato de tabla para mostrar en Jupyter
  mi_df <- data.frame("col1"=c("a","b","c"),"col2"=c(1,2,3))
  kable(mi_df)
        # Esta tabla podria copiarse en Jupyter y se ve en un mejor formato

  
##########
# Visualizamos otra tabla 
  glimpse(airports)
        # Se muestra la informacion de cada uno de los aeropuertos
  
        # faa y name son "variables de identificacion", cada uno de los aeropuertos se pueden identificar con estas variables
  
  
##########
# Para pegar columnas de tablas
  identificador <- paste(airports$faa,airports$name,sep=" - ")
        # Unimos dos columnas mediante un " - " 


  
  
  
  
  
  
  