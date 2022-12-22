# ///////////////////////////////////////////////////////////////////////////
# Sesion 14 - Ciencia de datos con R


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

# En .csv no se aceptan metadatos, en excel los metadatos son
# como las negritas, cursivas, etc (metadatos = datos sobre los datos)


# ------------------------------------------------------------------------------
dem_score <- read_csv("dem_score.csv")


library(readxl)
dem_score <- read_excel("dem_score.xlsx")
View(dem_score)     

# ------------------------------------------------------------------------------
#install.packages("fivethirtyeight")
library(fivethirtyeight)

glimpse(drinks)


drink_smaller <- drinks %>% 
  filter(country %in% c("USA","China",
                        "Italy", "Saudi Arabia", "Mexico")) %>% 
  select(-total_litres_of_pure_alcohol) %>% 
  rename("beer"=beer_servings,
         "spirit"=spirit_servings,
         "wine"=wine_servings)

# ------------------------------------------------------------------------------

# 























