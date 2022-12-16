# ///////////////////////////////////////////////////////////////////////////
# Sesion 10 - Ciencia de datos con R


library(nycflights13)
library(tidyverse)
library(knitr)
library(moderndive)
library(scales) 
library(zoo)


##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")

# El operador tuberia %>% se puede poner con Ctrl + Shift + M

# ------------------------------------------------------------------------------
# Estadisticas de resumen - summarize()

resumen_temp <- weather %>% 
  summarize(media=mean(temp,na.rm=T),
            desviacion=sd(temp,na.rm=T))

resumen_temp
        # 1. Las funciones que se aceptan en summarize son:
        # mean, sd, min, max, IQR, sum, n
        # n() es un recuento del numero de filas

# Para no prender el na.rm=T pudimos haber realizado esto
weather %>% 
  filter(!( temp=c(NA) )) %>% 
  summarize(mean(temp))
        # 1. Esto es para quitar los valores NA

# ------------------------------------------------------------------------------
# Muestra todos aquellos donde se tienen valores NA

tabla_prueba <- weather %>% 
  filter(temp %in% c(NA)) 

View(tabla_prueba)

# ------------------------------------------------------------------------------
# Para hacer conteo con la funcion n()

weather %>% 
  filter(temp %in% c(NA)) %>% 
  summarize(num_rows=n())

# ------------------------------------------------------------------------------
# Para saber los valores unicos de alguna columna
unique(weather$origin)

weather %>% 
  filter(origin=="JFK") %>% 
  summarize(temp_minima=min(temp,na.rm=T), temp_maximo=max(temp,na.rm=T))


weather %>% 
  filter(origin=="EWR") %>% 
  summarize(temp_minima=min(temp,na.rm=T), temp_maximo=max(temp,na.rm=T))


weather %>% 
  filter(origin=="LGA") %>% 
  summarize(temp_minima=min(temp,na.rm=T), temp_maximo=max(temp,na.rm=T))

        # 1. Siempre que el resultado de alguna funcion sea UN DATO, se podra
        # introducir cualquier funcion en summarize. Su input debe ser UNA COLUMNA

# No es practico hacer cada uno de forma separada

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# 3.05 Agrupamiento de filas

tabla_prueba <- weather %>% 
  group_by(month) # Con esta columna hara los grupos

        # 1. Con esto acreamos una tabla donde
        #    primero aparecen los del mes 1
        #    despues aparecen los del mes 2 y asi sucesivamente
        #    R lo piensa como que existen 12 tablas

View(tabla_prueba)


weather %>% 
  group_by(month) %>%  
  summarise(media=mean(temp,na.rm=T))
# Aqui calcula la media por cada una de las tablas

# ------------------------------------------------------------------------------
# Para cada dia del anio se pide mostrar la temperatura media en un horario desde 8am hasta 8pm

ejercicio <- weather %>% 
  filter(hour>=8,hour<=20) %>%  # Hasta aqui incluimos desde 8am y 8pm
  group_by(day,month) %>% 
  summarise(temp_media=mean(temp,na.rm=T)) %>%
  arrange(month) %>% 
  ungroup()

        # 1. Siempre que se use un grou_by es una buena practica el hacer "ungroup", para que 
        #    el resutlado no aparezca que esta agrupado
        # 2. Arrange lo que hace es ordenar de forma ascendente


# ------------------------------------------------------------------------------
mis_medidas = weather %>%
  filter(hour >=8, hour <=20) %>%
  group_by(month,day) %>%
  summarize(temp_media = mean(temp,na.rm=TRUE)) %>%
  arrange(month) %>%
  ungroup() %>%
  mutate(month_description = factor(month,labels = month.name))

# ------------------------------------------------------------------------------
# group_by() / ungroup()
# summarise()
# arrange()






















