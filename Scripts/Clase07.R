# ///////////////////////////////////////////////////////////////////////////
# Sesion 05 - Ciencia de datos con R


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
# Facetas


# Creamos un histograma normalito
ggplot()+
  geom_histogram(data=weather, mapping=aes(x=temp,fill=factor(month)),
                 color="white",alpha=0.5)

# 1. Buscamos tene runa buena idea de lo que pasa con la temperatura cada mes
# 2. Hemos usado colores y un alpha para poder distinguirlos pero no es tan visible 
#    las diferencias
# 3. Agregamos una faceta

ggplot()+
  geom_histogram(data=weather, mapping=aes(x=temp,fill=factor(month)),
                 color="white",alpha=0.5)+
  facet_wrap(~month)
        # 1. Todos tienen las mismas escalas en "x" y "y"
        # 2. Esta tecnica funciona con cualquier tipo de grafico

# ------------------------------------------------------------------------------
Mexico <- read.csv("Mexico_division_politica.csv")

ggplot() +
  geom_polygon(data = Mexico,
               mapping = aes(x=Longitud,y=Latitud,group=Grupo),
               fill = "steelblue",
               color = "black") +
  coord_map()+
  facet_wrap(~Grupo) # Este tiene 32 valores, las graficas salen muy pequeñas
        # 1. Con esto se trata de notar que no se debe abusar de las facetas

# ------------------------------------------------------------------------------
# Retomando el ejemplo:

ggplot()+
  geom_histogram(data=weather, mapping=aes(x=temp,fill=factor(month)),
                 color="white",alpha=0.5)+
  facet_wrap(~month,nrow=4)
        # 1. Se puede especificar un nrwo o ncol dentro del face_wrap

# ------------------------------------------------------------------------------
# Boxplot

clima_noviembre=weather%>%filter(month==11)
summary(clima_noviembre)
  # Q1:35.96 ---- Q2:44.96 --- Q3:51.98

# ------------------------------------------------------------------------------
# Los anchos de la caja no simbolizan algo
# Los bigotes sobresalen de la caja hasta (1.5)*(rango intercuantil)
#  donde Rango intercuantil = Q3-Q1

ggplot()+
  geom_boxplot(data=weather,mapping=aes(x=factor(month),y=temp,fill=factor(month)))
        # 1. Se escribe factor() para separar por grupos (meses)
        # factor() es para indicar que le estamos pasando CLASIFICACIONES

# ------------------------------------------------------------------------------
# Para calcular manualmente las barreras
barrera1 = 55.04-1.5*IQR(clima_mayo$temp)
barrera2 = 66.92+1.5*IQR(clima_mayo$temp)

clima_mayo %>% filter(temp>barrera2)
clima_mayo %>% filter(temp<barrera1)
# ------------------------------------------------------------------------------
# Para crear los boxplot en horizontal
ggplot()+
  geom_boxplot(data=weather,mapping=aes(y=factor(month),x=temp,fill=factor(month)))

# ------------------------------------------------------------------------------

ggplot() +
  geom_boxplot(data = weather,
               mapping = aes(x=factor(month),y=temp,
                             fill=origin))
        # 1. Con este argumento fill nos permite visualizar, para cada uno de los meses,
        #    la temperatura en cada uno de los aeropuertos, puestos uno al lado del otro

# ------------------------------------------------------------------------------
# facet_wrap(~variable): permite incluir facetas de un mismo grafico
#                     argumentos: nrow, ncol (debe ser un DIVISOR del numero de nrow o ncol que especifiquemos)

# geom_boxplot()






















