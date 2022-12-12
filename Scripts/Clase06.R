# ///////////////////////////////////////////////////////////////////////////
# Sesion 06 - Ciencia de datos con R

library(nycflights13)
library(tidyverse)
library(knitr)
library(moderndive)
library(scales) # Sirve para escalas temporales (eje x)
library(zoo)


##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")


# ------------------------------------------------------------------------------
ggplot()+
  geom_point(data=weather,mapping = aes(x=temp),
             y=0,size=5,alpha=0.1)+
  ylim(c(-0.25,0.25))+
  scale_x_continuous(breaks=seq(0,100,10))
        # 1. ylim es para definir de donde a donde graficar
        # 2. En "aes" solo metemos "x=temp" y la otra variable toma valor 0
        # 3. y=0 se pone fuera de "aes" porque no depende de las columnas de data
        # 4. Todas las observaciones se encuentran y=0
        # 5. Lo que logramos ver con la grafica es un problema de superposicion 

# ------------------------------------------------------------------------------
# Histogramas con frecuencia ABSOLUTA

# Alternativa: bins
ggplot()+
  geom_histogram(data = weather,mapping = aes(x = temp),
                 color = "green", fill="steelblue",
                 bins=10)
        # 1. Solo se le pone la variable x, es la variable que va a "seccionar"
        # 2. El argumento "color" sirve para el borde de los rectangulos
        # 3. Con "fill" se establece el color del relleno del rectangulo
        # 4. Por defecto realiza 30 bins, pero se puede ajustar con el argumento "bins" o "binwidth"


# Alternativa: binwidth
ggplot()+
  geom_histogram(data = weather,mapping = aes(x = temp),
                 color = "green", fill="steelblue",
                 binwidth = 10)

# Alternativa: Metodo sturges
# Podria usarse al formula para calcular el numero optimo

# ------------------------------------------------------------------------------
# Histogramas con frecuencia RELATIVA

ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp,y=..density..),
                 color = "white",
                 bins = 16)
        # 1. En la estetica "y" se pone "density" para realizar el histograma
        #    como comunmente se conoce
        # 2. El valor de la ordenada y se multiplica por 1000 para obtener
        #    el valor de la fraccion

# ------------------------------------------------------------------------------
ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp,y=..count../sum(..count..)),
                 color = "white",
                 bins = 20) +
  scale_y_continuous(labels = scales::percent)
        # 1. Con esta escala en y se puede poner procentajes

# ------------------------------------------------------------------------------
ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp,y=..density..),
                 color = "white",
                 bins = 10) +
  geom_density(data = weather,
               mapping = aes(x=temp),
               color = "black",
               fill = "yellow",
               alpha = 0.5)
        # 1. Se usa geom_density para graficar la density
        # 2. La density se puede rellenar con "fill"
# ------------------------------------------------------------------------------
sismos <- read.csv("sismos.csv")


ggplot()+
  geom_density(data=sismos,mapping=aes(x=Magnitud,fill=entidad),alpha=0.5)
        # 1. Coloreamos la magnitud de acuerdo a cada entidad


mis_entidades = c("OAX","BC","CHIS","GRO")
sismos_entidades = sismos %>% filter(entidad %in% mis_entidades)
        # Estos son los datos para algunas entidades (las definidias arriba)
ggplot()+
  geom_density(data=sismos_entidades,mapping=aes(x=Magnitud,fill=entidad),alpha=0.5)


# ------------------------------------------------------------------------------
# ylim(~), de forma similar xlim(~) (su argumento es un vector)
# colors(): sirve para ver todos los colores posibles
# geom_histogram(): Para trazar un histograma, en "aes" solo se mete el valor de x
#    argumentos: color, fill, bins o binwidth
# geom_density()
#    argumetos: color, fill, 




















