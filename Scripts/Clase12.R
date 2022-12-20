# ///////////////////////////////////////////////////////////////////////////
# Sesion 12 - Ciencia de datos con R


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
#arrange()

flights %>% names()

# Queremos conocer cual es el "destino" mas frecuente

flights %>% group_by(dest) %>% 
  summarise(total_de_vuelos=n())
        # 1. Agrupamos por "destino" y luego contamos los
        #    renglones

### Continuacion
flights %>% group_by(dest) %>% 
  summarise(total_de_vuelos=n()) %>% 
  arrange(total_de_vuelos)
        # 1. Le pedimos que se ordene de acuerdo con la variable total_de_vuelos

### Continuacion
flights %>% group_by(dest) %>% 
  summarise(total_de_vuelos=n()) %>% 
  arrange(-total_de_vuelos)
        # 1. Le agregamos un signo menos para que cambie el orden en que presenta los datos
        # 2. El signo "-" solo funciona cuando se tienen valores numericos

# Otra forma de cambiar el orden
flights %>% group_by(dest) %>% 
  summarise(total_de_vuelos=n()) %>% 
  arrange(desc(total_de_vuelos))

##### Otro ejemplo:
sismos <- read.csv("sismos.csv")


sismos %>% 
  filter(Magnitud>=7) %>% 
  arrange(desc(entidad),Magnitud) %>% 
  View()
        # 1. El primer criterio de ordenamiento es entidad
        #    el criterio de desempate sera el valor de "Magnitud"

# ------------------------------------------------------------------------------
#innerjoin()

#carrier representa la aerolinea que realizo el vuelo, son CODIGOS, no el nombre

# Tenemos dos tablas del nycflights:
flights
airlines
      # airlines tien el CODIGO y nombre de la aerolinea

# Objetivo: queremos llevarnos la informacion de una tabla hacia la otra
# Se usara una variable clave, asi como en SQL

inner_join(flights,airlines) %>% View()
        # No especificamos quien es la variable clave, solito lo deduce
        # La variable clave es "carrier", es la que aparece en ambas


### Esto es con la notacion de %>% 
flights_joined <- flights %>% inner_join(airlines)
        #1. El inner_join() se queda unicamente con las filas donde encontro alguna coincidencia        
        #   si algun renglon no tuviera valor de airline, se elimina de la tabla resultante
  
# ------------------------------------------------------------------------------
# inner_join() con diferntes nombres de la columna clave

# Tenemos otro dataframe:
airports
      # la variable "faa" de airpots se puede conectar a la tabla 
      # flights desde la variable "origin" o "dest"

# En el innerjoin() se usa un argumento para especificar lo anterior

flights %>% inner_join(airports,
                       by = c("dest"="faa")) %>% View()


##### Podemos resringir que informacion queremos llevar
flights %>% inner_join(airports[,c("faa","name")],
                       by = c("dest"="faa")) %>% View()
        # 1. Aqui solo nos estamos llevando la columna "name" de airports a flights   
        #    pero NO se nos debe olvidar que se debe incluir la variable clave para hacer el join

# ------------------------------------------------------------------------------
# rename()

named_dests <- flights %>%
  group_by(dest) %>%
  summarize(num_flights = n()) %>%
  inner_join(airports, by = c("dest" = "faa")) %>%
  rename(airport_name = name) #a la columna "name" llamala "airport_name"

named_dests %>%  View()

# ------------------------------------------------------------------------------
# Creando una "variable clave" artificial para hacer el inner_join 
weather <- weather %>% mutate(Id=paste(year,
                            month,day,hour,
                            origin,sep="_"))
        # 1. Pegamos varias variables usando "mutate"
        # 2. Con "sep" especificamos como queremos que los una
    
flights <- flights %>% mutate(Id=paste(year,
                            month,day,hour,
                            origin,sep="_"))

# Ahora ya se tiene una variable en comun ambas tablas

flights %>%
  inner_join(weather,by=c("Id"="Id")) %>% View



vuelos_con_infor_clima = flights %>%
  inner_join(weather[,c("Id","temp","humid")],
             by = c("Id"="Id"))


# ------------------------------------------------------------------------------
#arrange(~): permite ordenar valores de acuerdo a la variable ~, por
#            default ordena de menor a mayor. Se puede agregar mas variable para
#            considerar criterios de desempate

# inner_join(): inner join de sql en R
# inner_join( ~ , by = c() ): cuando las tablas tienen columnas clave con diferente nombre

# write.csv(tabla, "nombre"): para exportar tablas

# rename(): cambia el nombre de una columna, primero se pone el nuevo nombre y luego el antiguo nombre


































