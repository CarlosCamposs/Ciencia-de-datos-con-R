# ///////////////////////////////////////////////////////////////////////////
# Sesion 11 - Ciencia de datos con R

library(nycflights13)
library(tidyverse)
library(knitr)
library(moderndive)
library(scales) 
library(zoo)

##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")

# Ctrl + Shift + M : %>% 

# ------------------------------------------------------------------------------
resumen_mensual <-  weather %>% 
    group_by(month) 
        # Hasta aqui divide la tabla de weather en 12 subtablas, una por cada mes

  
resumen_mensual_temperaturas <- weather %>% 
    group_by(month) %>% 
    summarize(mean = mean(temp, na.rm = TRUE), 
              std_dev = sd(temp, na.rm = TRUE))
        # Por cada uno de los meses, pedimos mostrar la mean y sd

# Visualizamos la tabla  
resumen_mensual_temperaturas

# METADATOS son datos sobre los datos, group_by() cambia los metadatos, no modifica 
# la estructura real de la tabla

# Con el ungroup() se elimina la estructura de METADATOS, y la tabla se queda
# con la nueva estructura
# ------------------------------------------------------------------------------
?diamonds

diamonds %>% 
  group_by(cut) %>% 
  summarize(avg_price=mean(price))


ggplot()+
  geom_point(data=diamonds, mapping=aes(x=carat,y=price, color=cut))
        # Solo era para ver que a mayor peso, mayor precio

# ------------------------------------------------------------------------------

flights %>% 
  group_by(origin) %>% 
  summarise(total_de_vuelos=n())
        # 1. n() cuenta el numero de registros de una tabla, y como se uso
        #    group_by(), entonces tendremos 3 subtablitas, y para cada una
        #    de ellas se contara el numero de registors

# ------------------------------------------------------------------------------

# No correr
flights %>% 
  group_by(origin) %>% 
  group_by(month) %>% 
  summarize(count = n())
        # 1. No es posible hacer el group_by() se esta forma, por alguna razon
        #    ignora el primer group_by()

# Si se desea agrupar por dos o mas variables se deb eincluir todas las variables
# al mismotiempo en el group_by()

flights %>% 
  group_by(origin,month) %>% 
  summarize(total = n()) %>% # No desagrupamos y volvemos a pedir un summarise()
  summarize(media=mean(total))


# ------------------------------------------------------------------------------
##### Columnas calculadas

names(weather)
        # 1. Tenemos las temperaturas en grados F

weather <- weather %>% 
  mutate(temperatura_en_C=(temp-32)/1.8)
        # 1. Definimos el nombre de la nueva columna y como se calcula
        # 2. Estamos pidiendo que la construya pero no que la guarde
        # 3. Si hubieramos nombrado "temp" la nueva columna, lo que hubieramos 
        #    hecho es sobreescribir esa columna

View(weather)

# ------------------------------------------------------------------------------
# Temperaturas medias por mes, en F y C

resumen_mensual_temperaturas <- weather %>% 
  group_by(month) %>% 
  summarize(mean_temp_in_F = mean(temp, na.rm = TRUE), 
            mean_temp_in_C = mean(temp_in_C, na.rm = TRUE))

resumen_mensual_temperaturas
# ------------------------------------------------------------------------------
# gain: referente a salir con retraso pero se llego a tiempo
# gain = tiempo retraso en salida - tiempo retraso en llegada (arrive)

flights <- flights %>% 
  mutate(gain = dep_delay - arr_delay)
        # 1. Creamos una columna denominada "gain"
        # 2. Con esta nueva tabla ya podriamos mostrar algun summarise()

# Graficamos el histograma
ggplot() +
  geom_histogram(data = flights, mapping = aes(x = gain),
                 color = "white", bins = 20)

# ------------------------------------------------------------------------------
# Se pueden crear varias columnas dentro del mismo mutate()



flights <- flights %>% 
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours)

flights


# ------------------------------------------------------------------------------
# group_by()
# ungroup()
# n()
# mutate()














