# ///////////////////////////////////////////////////////////////////////////
# Sesion 15 - Ciencia de datos con R


library(nycflights13)
library(tidyverse)
library(knitr)
library(moderndive)
library(scales) 
library(zoo)
library(fivethirtyeight)

##########
# Cargamos los datos
setwd("C:/Users/Carlos Daniel/Desktop/GitHub/Ciencia-de-datos-con-R/datasets")

# ------------------------------------------------------------------------------

drink_smaller <- drinks %>%
  filter(country %in% c("USA",
                        "China",
                        "Italy",
                        "Saudi Arabia",
                        "Mexico")) %>%
  select(-total_litres_of_pure_alcohol) %>%
  rename(beer = beer_servings,
         spirit = spirit_servings,
         wine = wine_servings)

drink_smaller

# ------------------------------------------------------------------------------
# Hay tres variables que corresponde  a tres piezas unicas de informacion:
# fecha, precio, clima

# ------------------------------------------------------------------------------
# pivot_longer(): convertir en formato tidy

drinks_smaller_tidy <- drink_smaller %>%
  pivot_longer(names_to="type",
               values_to="servings",
               cols=-country)
        # 1. La funcion pivto debe tener esos argumentos
        # names_to : nombre de la variable categorica
        # values_to:

# 1. beer, spritir y wine se van a una columna llamada "type"
# 2. Se crea una nueva columna llamada "servings" y va pegando los valores
      # type  servings
      # beer  79
      # beer  85
      # beer  238
#3. En "cols" indico no quiero en formato "tidy" y ordenado los valores
#   en una ultima columna
      # type  servings  country
      # beer  79        China
      # beer  85        Italy
      # beer  238       Mexico

# Este proceso de convertir a tipo "tidy" puede hacerse a mano
# ------------------------------------------------------------------------------


# Con formato tidy
ggplot()+
  geom_col(data=drinks_smaller_tidy,
           mapping=aes(x=country,y=servings,fill=type),
           position="dodge")
        # 1. El argumento de poisition es para poner las graficas una al lado de la otra,
        #    en lugar de que las muestre al lado


# Sin formato tidy

ggplot(data=drink_smaller)+
  geom_col(mapping = aes(x=country,y=beer),alpha=0.5,fill="red")+
  geom_col(mapping = aes(x=country,y=spirit),alpha=0.5,fill="blue")+
  geom_col(mapping = aes(x=country,y=wine),alpha=0.5,fill="green")

# ------------------------------------------------------------------------------
# geom_col():
# con argumento position="dodge" permite colocar graficas de barra una al lado de la otra






















