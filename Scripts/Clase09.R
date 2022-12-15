# ///////////////////////////////////////////////////////////////////////////
# Sesion 08 - Ciencia de datos con R


library(nycflights13)
library(tidyverse)
library(knitr)
library(moderndive)
library(scales) 
library(zoo)


##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")

# ------------------------------------------------------------------------------

# Para listar los archivos que tenemos en el wd
dir()
sismos <- read.csv("sismos.csv")

magnitud_promedio <- mean(sismos$Magnitud)
sismos_enero <- sismos %>% filter(mes==1)

# Para cargar objetos creados en en Enviroment de RStudio
load("objetos_creados.RData")
        # 1. Esto permite leer mucho mas rapido los datos que se tarden en cargar
        #    es decir, con esto cargaria mas rapido la tabla "sismos" desde csv  

# ------------------------------------------------------------------------------
# Para exportar varias graficas de forma automatizada

library(nycflights13)

aeropuertos = c("EWR","JFK","LGA")

mi_guardadora = function(x){
  
  tabla = flights %>% filter(origin == aeropuertos[x])
  p = ggplot() +
    geom_point(data = tabla,
               mapping = aes(x=dep_delay,y=arr_delay))
  
  nombre_grafica = paste0("grafica_de_",aeropuertos[x],".png")
  ggsave(nombre_grafica,device="png")
}

lapply(1:3,mi_guardadora)


# ------------------------------------------------------------------------------









# ------------------------------------------------------------------------------




























