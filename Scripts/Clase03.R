# ///////////////////////////////////////////////////////////////////////////
# Sesion 03 - Ciencia de datos con R


library(nycflights13)
library(tidyverse)
library(knitr)

##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")
sismos <- read.csv("sismos.csv")


##########
# Establecemos de donde toma los valores
# Dentro de "geom" se especifican las "esteticas"
ggplot(data=sismos)+
  geom_point(mapping=aes(x=Longitud,y=Latitud, color=zona),alpha=0.1)+
  coord_map()

# ------------------------------------------------------------------------------
        # 1.alpha es para establecer transparencias
        # 2."aes" es solo para convertir columnas en caracteristicas
              #vg. x=Longitud, y=Latitud y podriamos poner size=Magnitud
        # 3. Todo aquello que sea algo estetico pero no datos de una columna,  
        #    estos se ponen afuera
        # 4. "color" va adentro porque las esteticas "aes" van a depender de
        #     columnas

# Regla general: cuando se pone algo dentro de "aes" es porque esa
# caracteristica va a depender de alguna columna, sino se pone por afuera de "aes"
# ------------------------------------------------------------------------------        


placas <- read.csv("Mexico_placas_tectonicas.csv")
str(placas) # structure de placas
        # "Tipo" hace referencia a la placa tectonica

# ------------------------------------------------------------------------------
# Cuando se vayan a usar variablas tablas (en este caso dos) es mejor especificar
# en la "geo" (geometria) los datos, luego le podemos agregar una "capa" de la otra
# tabla
# ------------------------------------------------------------------------------

ggplot() +
  geom_point(data=sismos,mapping = aes(x=Longitud,y=Latitud,color=zona),alpha=0.1) +
  geom_path(data=placas,mapping = aes(x=Longitud,y=Latitud,color=Tipo),size=2) +
  coord_map()

# ------------------------------------------------------------------------------
        # 1. geompath va a graficar puntos y los va a unir con una linea y los va 
        #    a colorear de acuerdo el "Tipo"
        # 2. Importa mucho el orden en que agreguemos las capas, pues las capas 
        #    se van agregando encima de la grafica











