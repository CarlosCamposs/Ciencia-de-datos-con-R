# ///////////////////////////////////////////////////////////////////////////
# Sesion 05 - Ciencia de datos con R


library(nycflights13)
library(tidyverse)
library(knitr)
library(moderndive)
library(scales) # Sirve para escalas temporales (eje x)
#install.packages("moderndive")


##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")

# Graficos de linea
# En estos graficos vamos a tener que la variable X tiene un ordenamiento (fenomenos temporales)
# ------------------------------------------------------------------------------

str(weather)
?weather

# ------------------------------------------------------------------------------
library(moderndive)
##########
# Hacemos un grafico de linea


ggplot()+
  geom_line(data=early_january_weather,
             mapping = aes(x=time_hour,y=temp))
        # 1. Dejamos de usar "geom_point" y ahora usamos "geom_line
        #    para hacer un grafico de linea
        # 2. No es tan visible la escala del eje X

# ------------------------------------------------------------------------------
library(scales)
##########
# Agregamos una capa que nos permita ver el numero de dias en el eje X


ggplot()+
  geom_line(data=early_january_weather,
            mapping = aes(x=time_hour,y=temp))+
  scale_x_datetime(breaks=date_breaks("1 day")) 
        # 1. Establecemos que queremos las marcas de un dia

# ------------------------------------------------------------------------------
##########
# Agregamos labs a la grafica

ggplot()+
  geom_line(data=early_january_weather,
            mapping = aes(x=time_hour,y=temp))+
  scale_x_datetime(breaks=date_breaks("1 day"))+
  labs(x="Dia",y="Temperatura F")

# ------------------------------------------------------------------------------
##########
# Giramos los datos de "x" 45 grados

ggplot()+
  geom_line(data=early_january_weather,
            mapping = aes(x=time_hour,y=temp))+
  scale_x_datetime(breaks=date_breaks("1 day"))+
  labs(x="Dia",y="Temperatura F")+
  theme(axis.text.x=element_text(angle=45))

# ------------------------------------------------------------------------------
##########
# Realizamos un ajuste horizontal al eje x

ggplot() +
  geom_line(data = early_january_weather,
            mapping = aes(x = time_hour, y = temp)) +
  scale_x_datetime(breaks=date_breaks("1 day")) +
  labs(x="Dia", y="Temperatura F") +
  theme(axis.text.x = element_text(angle = 45,hjust=1))

# ------------------------------------------------------------------------------

class(early_january_weather$time_hour)
# POSIXct

# ------------------------------------------------------------------------------
##########
# Leemos una nueva base de datos

total_sismos_recientes <- read.csv("total_sismos_recientes.csv")

str(total_sismos_recientes)
        # Numero de sismos que huob en :
        # Enero 2012-2022, Febrero 2012-2022, ..., Diciembre 2021

# ------------------------------------------------------------------------------
##########
# Graficamos con uno de linea

ggplot()+
  geom_line(data=total_sismos_recientes,
            mapping = aes(x=mes_anio,y=Total))

class(total_sismos_recientes$mes_anio)
        # 1. Debemos verificar que la columna del eje X sea tipo tiempo, por
        #    ejemplo "POSIXct"

# ------------------------------------------------------------------------------
install.packages("zoo")
library(zoo)

##########
# Convertirmos la columna a fechas
# A la funcion as.yearmon()
# Se le pone una columna de tipo character que tenga sentido convertirla en "mes-año"


as.yearmon(total_sismos_recientes$mes_anio,"%m/%Y") 
        # 1. La Y se usa en mayusucla, se pone "y" cuando solo tenemos los dos ultimos digitos

# ------------------------------------------------------------------------------

ggplot()+
  geom_line(data=total_sismos_recientes,
            mapping = aes(x=as.yearmon(mes_anio,"%m/%Y")
                          , y=Total))
        # 1. Dentro de la estetica "aes" hacemos uso de as.yearmon()

# ------------------------------------------------------------------------------

ggplot()+
  geom_line(data=total_sismos_recientes,
            mapping = aes(x=as.yearmon(mes_anio,"%m/%Y")
                          , y=Total,
                          color=factor(anio)) )+
  labs(x="Mes/Año")
        # 1. Coloreamos cada año con un color distinto

# ------------------------------------------------------------------------------
# Ahora hacemos una grafica donde el eje X no es una "variable temporal"

ggplot()+
  geom_line(data=total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio)))
        # 1. Lo que le estamos diciendo es que todos los "2012" los una solo con un color
        #    todos los "2013" con otro color, y asi sucesivamente
  
        # 2. Notemos que "mes" no es de tipo fecha

# ------------------------------------------------------------------------------

# Agregamos los meses en el eje X

ggplot()+
  geom_line(data=total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio)))+
  scale_x_continuous(breaks=1:12,labels=month.name)
        # 1. Los "breaks" se refiere a las marcas que queremos, en este caso, en el eje X
        # 2. breaks y labels deben tener la misma longitud

#month.name es un vector que ya viene en R y contiene los nombre de los meses en ingles

# ------------------------------------------------------------------------------

ggplot()+
  geom_line(data=total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio)))+
  scale_x_continuous(breaks=1:12,labels=month.name)+
  geom_vline(xintercept = 5)

# ------------------------------------------------------------------------------



# Nuevas capas:
# scale_x_datetime(): es cuando la variable es de tipo "fecha"
# labs()
# theme(axis.text.x = ~ )
# scale_x_continuous(): es cuando la variable NO es de tipo "fecha"
# geom_vline(xintercept = ~ ): para agregar una linea vertical


# Podriamos aplicar color usando "color=factor(variable_datos)",
# al usar factor() estamos diciendole que tome la variable  "variable_datos"
# como variable categorica

# vector "month.name"


# Funciones:
# as.yearmon()



