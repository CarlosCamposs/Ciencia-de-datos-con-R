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
##### Graficos de barra
# Los graficos de barras son utiles para visualizar el distribucion de una
# variable categorica (nominal)

# Los niveles o factores son los distintos valores (hombre o mujer, vg)

# Esto nos permtie diferenciar si las variables estan "precontadas"
frutas <- data.frame(tipo = c("manzana", "manzana", "naranja", "manzana", "naranja"))
frutas_contadas <- data.frame(tipo = c("manzana", "naranja"),total = c(3, 2)) 
        # 1. La primera es informacion dispera
        # 2. La segunda esta precontada


# ggplot tiene dos tipos de graficos de barra
# ------------------------------------------------------------------------------
# Cuando se tiene la informacion DISPERSA, se usa geom_bar()

ggplot()+
  geom_bar(data=frutas, mapping=aes(x=tipo),
           fill=c("red","orange"), color="black")
        # 1. "tipo" es el nombre de la columna
        # 2. Se le puede agregar todo lo que ya sabemos
        # 3. Lo que se le "da de comer" es una variable categorica (clasificadora)


# Si llegaramos a usar el "data=frutas_contadas" solo va a mostrar que ambas tienen el mismo numero
# Cuenta una vez "manzana" y una vez "naranja"

# ------------------------------------------------------------------------------
# Cuando se tiene la informacion PRECONTADA, se usa geom_col()


ggplot() +
  geom_col(data = frutas_contadas,
           mapping = aes(x = tipo, y = total), fill=c("red","orange"),
           color="black")
        # 1. Se le dice explicitamente quien es el valord de y (la altura de la barra)

# ------------------------------------------------------------------------------
glimpse(flights)
head(flights)
# "carrier" hace referencia a la aerolinea

ggplot()+
  geom_bar(data=flights, mapping=aes(x=carrier,fill=carrier) )

# Con la funcion table() se puede hace un conteo de cada clasificador
table(flights$carrier)

# ------------------------------------------------------------------------------
# Suponiendo que tenemos los datos de esta forma (precontados)
vuelos_contados <- data.frame(aerolinea = c("9E","AA","AS","B6","DL","EV","F9","FL","HA","MQ","OO","UA","US","VX","WN","YV"),
                              total_vuelos = c(18460,32729,714,54635,48110,54173,685,3260,342,26397,32,58665,20536,5162,12275,601))

ggplot()+
  geom_col(data=vuelos_contados,
           mapping=aes(x=aerolinea,y=total_vuelos,
                       fill=aerolinea))

# ------------------------------------------------------------------------------
# Graficos de barra con DOS variables categorias
# Visualizar la distribucion conjunta de dos variables categoricas


ggplot() + 
  geom_bar(data = flights, mapping = aes(x = carrier, fill=origin))
        # 1. La altura de cada color representa el numero de cada "origin"
        # 2. Decimos que los datos estan "APILADOS"

# Nos hace un conteo por cada aerolinea y luego los separa por "origin"
table(flights$carrier,flights$origin)

# ------------------------------------------------------------------------------
# Grafico de barras paralelas

ggplot() + 
  geom_bar(data = flights, mapping = aes(x = carrier, fill=origin),
           position="dodge")
        # 1. El argumento "position" permite poner graficos de barra uno al lado del otro
        # 2. Hay algunas aerolineas donde las barras son mas anchas (dado que no existen valores para los otro origin)


ggplot() + 
  geom_bar(data = flights, mapping = aes(x = carrier, fill=origin),
           position = position_dodge(preserve = "single"))
      # 1. Lo que ocurre es que las barras tienen el mismo ancho

# ------------------------------------------------------------------------------
# Grafico de barras FACETADO

ggplot() +
  geom_bar(data = flights, mapping = aes(x = carrier, fill=carrier)) +
  facet_wrap(~ origin, ncol = 1)
        # 1. El facetado lo estamos haciendo mediante la variable "origin"
        #    entonces para cada valor de origin (3) se muestran graficas de barra
        #    para cada total de  vuelos

# ------------------------------------------------------------------------------
# Vamos a ver como poner etiquetas

ggplot()+
  geom_bar(data=flights, mapping=aes(x=carrier,fill=carrier) )

# Sacamos los valores (contados)
valores <- as.data.frame(table(flights$carrier)) 
names(valores) <- c("carrier","total")
valores

ggplot()+
  geom_bar(data=flights, mapping=aes(x=carrier,fill=carrier) )+
  geom_text(data=valores, 
            mapping=aes(x=1:16,y=total+1500, label=total,color=carrier))  
        # 1. Estamos poniendo los valores de "total" a mitad de la altura de las graficas
        # 2. geomtext() se basa en coordenadas, y en caso de graficas de barras
        #    es como si el eje x fuera de 1:16

# ------------------------------------------------------------------------------
# Para cambiar titulos y temas


ggplot()+
  geom_bar(data=flights, mapping=aes(x=carrier,fill=carrier) )+
  geom_text(data=valores, 
            mapping=aes(x=1:16,y=total+1500, label=total,color=carrier))  










# ------------------------------------------------------------------------------

# geom_bar(): grafico de barras para datos disperos
# geom_col(): grafico de barras para datos precontados, x=tipo, y=total
# table(): sirve para realizar un conteo de cada dato categorico
# geom_text(): con el argumento "label" se puede poner algun texto en la grafica

# Virgulilla: ~ pertenece al conjunto de FIRULETES

#Firuletes: ~, ´, i, dieresis












