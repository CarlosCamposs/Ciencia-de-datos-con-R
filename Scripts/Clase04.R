# ///////////////////////////////////////////////////////////////////////////
# Sesion 04 - Ciencia de datos con R


library(nycflights13)
library(tidyverse)
library(knitr)

##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")
alaska_flights <- read.csv("alaska.csv")
        # Vuelos que salieron de la NYCFlights (3 aeropuertos) hacia Alaska

# ------------------------------------------------------------------------------
names(alaska_flights)
glimpse(alaska_flights)
        # Vemos la informacion y estructura de los datos

# ------------------------------------------------------------------------------
ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x = dep_delay, y = arr_delay))+
  geom_smooth(data = alaska_flights,method="lm",
              mapping = aes(x = dep_delay, y = arr_delay)) #Añadir una linea de regresion

        # Retraso en salida en X
        # Retraso en llegada en Y
        # Si le agregamos la capa geom_path() se uniran los puntos mediante una linea

nrow(alaska_flights)
        # 714 puntos, pero quito 5 la grafica porque se tenian valores NA

# ------------------------------------------------------------------------------
faltantes <- alaska_flights[is.na(alaska_flights$dep_delay)
               |
               is.na(alaska_flights$arr_delay),]


        # 1.  is.na() - Muestra que valores son NA, devuelve valores booleanos
        # 2.  La barra vertical "|" significa "Or" (disyuncion)
        # 3.  Estamos pidiendo que muestre aquellos en los que AL MENOS haga falta un
        #     un valor y tambien mostrar todas las columnas

View(faltantes)

# ------------------------------------------------------------------------------
ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x = dep_delay, y = arr_delay))+
  geom_abline(slope=1,intercept = 0, color="red") 
        # 1. Se grafica la recta y=x

# ------------------------------------------------------------------------------
# Superposicion

##########
# Primer metodo: agregar transparencias
ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x = dep_delay, y = arr_delay), alpha=0.3)
  
        # 1. Se uso el argumento "alpha" fuera de las "esteticas" (aes)

##########
# Segundo metodo: agitar los puntos (nerviosismo)
    # Se mueven en una direccion aleatoria

mi_data=data.frame("X"=c(0,0,0,0), "Y"=c(0,0,0,0))
mi_data


ggplot()+
  geom_point(data=mi_data,mapping=aes(x=X,y=Y))
        # 1. Tenemos los cuatro puntos encimados

ggplot()+
  geom_jitter(data=mi_data,mapping=aes(x=X,y=Y))
        # 1. Se movieron los puntos, muy poco
        # 2. Solo es una herramienta de visualizacion, no cambia el valor de los datos


ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x = dep_delay, y = arr_delay),alpha=0.3)+
  geom_jitter(data=alaska_flights,
              mapping = aes(x = dep_delay, y = arr_delay),
              width=0.5,height=0.5,alpha=0.3)
        # 1. Se agrega nerviosisimo  de forma "controlada" o "manual"



# ------------------------------------------------------------------------------
matriculas = alaska_flights %>%
  group_by(tailnum) %>%
  count() %>%
  rename(Total = n)

ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x=tailnum,y=arr_delay,color=factor(month))) +
  theme(axis.text.x = element_text(angle=90))
        # 1. Podemos ver el numero de viajes que hizo cada avion
        #        X=variable categorica, Y= variable numerica
        # 2. Es como ver frecuencias de aviones
        # 3. Con "angle=90" se ponen los textos en vertical

# ------------------------------------------------------------------------------




####################
# Funciones usadas: 
# geom_jitter(): ruido aleatorio a los puntos
# geom_abline(): recta
# geom_smooth(): linea de regresion
# theme(axis.text.x)





















