# Julián Valdés Bello - 1026302600
# Análisis exploratorio de datos con R: Estudio de caso en una base de datos de carros del año 1999

# Instalación de paquetes necesarios
#install.packages("tidyr")
library(MASS)
library(descr)
library(ggplot2)
library(forcats)
library(tidyr)

# Lectura del conjunto de datos
base_carros = read.csv("dataset-83422.csv")

## Frecuencia absoluta

# Cálculo de tabla de frecuencias
frec_abs = table(base_carros$Manufacturer)
frec_abs

# Frecuencia relativa
frec_rel = prop.table(frec_abs)
frec_rel

# Tabla de frecuencias con gráfico
par(col.axis = "#b5e853", bg="#000000e6", fg="#b5e853", col="#b5e853")
frec_tabla = freq(base_carros$Manufacturer, plot = TRUE)
frec_tabla

##Grafica de Barras GGPLOT2

# Grafica de Barras variables cualitativas
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer, fill=Manufacturer))+
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"),)


# Gráfica de barras con frecuencias relativas
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer, y = stat(prop), fill = Origin, group = Origin)) +
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853")) +
  labs(x = "Manufacturer", y = "Frecuencia relativa", fill = "Origin")

  

# Grafica de barras que muestra la proporción de una variable categórica (Manufacturer).
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = fct_reorder(Manufacturer,Manufacturer,length), y = stat(prop), fill = Origin, group = Origin)) +
  labs(x = "Manufacturer", y = "Frecuencia relativa", title = "Frecuencia relativa de fabricantes de autos") +
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"))

# Grafica de barras apiladas
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer, fill = AirBags))+
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"))


# Grafica proporcion
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer, fill = Type), position = "fill")+
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"))

##Graficas Circulares GGPLOT2

# Primero creamos los datos de la tabla de frecuencia absoluta y relativa
frecuencia = table(base_carros$Manufacturer)
proporcion = frecuencia/nrow(base_carros)
frecuencia

#  creamos un dataframe, es decir una tabla de datos con la frecuencia absoluta y relativa por fabricante
resumen_manufacturer = data.frame(Manufacturer = names(frecuencia),freq = as.vector(frecuencia), prop = as.vector(proporcion))
View(resumen_manufacturer)

ggplot(resumen_manufacturer, aes(x = "", y = prop, fill = Manufacturer)) +
  geom_bar(stat = "identity")  +
  coord_polar("y") +
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"))


ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer, fill= Origin)) +
  coord_polar()+
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#b5e853"),
        panel.grid.minor = element_line(color = "#b5e853"),
        axis.text = element_text(color = "#ffffff"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"))

# Histograma 

ggplot(base_carros, aes(x = Price, y = EngineSize)) + 
  geom_bin2d() +
  scale_fill_gradient(low = "#ebf7d5", high = "#a1e61e") +
  labs(title = "Histograma 2D de Precio y Tamaño del Motor", x = "Precio", y = "Tamaño del Motor")+
  theme(panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"))



################################################################################
# Tabulación cruzada con crosstab()
res_tab <- crosstab(base_carros$Model, base_carros$Model, prop.r = T, prop.c = T, total.r = T)

# Acceder a las diferentes tablas de frecuencia
res_tab[["prop.row"]]
res_tab[["prop.col"]]
res_tab[["prop.tbl"]] # No Funciono


################################################################################




# Tabulación cruzada con xtabs
tab <- xtabs(~ AirBags + DriveTrain, data = base_carros)

# Frecuencias relativas por fila
prop.row <- prop.table(tab, margin = 1)
print(prop.row)

# Frecuencias relativas por columna
prop.col <- prop.table(tab, margin = 2)
print(prop.col)

# Frecuencias relativas por tabla
prop.tbl <- prop.table(tab)
print(prop.tbl)

df <- as.data.frame(tab)
df <- pivot_longer(df, cols = c(Freq), names_to = "count", values_to = "value")

ggplot(df, aes(x = DriveTrain, y = AirBags, fill = value)) + 
  geom_tile(color = "#000000") +
  scale_fill_gradient(low = "#ebf7d5", high = "#a1e61e") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1), 
        panel.background = element_rect(fill = "#000000"),
        plot.background = element_rect(fill = "#000000"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853")) +
  labs(x = "DriveTrain", y = "AirBags")


# Medidas de tendencia central o localización

# Media de caballos de fuerza *Horsepower*
mean(base_carros$Horsepower, na.rm=TRUE)

# Media recortada de caballos de fuerza *Horsepower*
mean(base_carros$Horsepower, na.rm=TRUE, trim=0.5)

# Mediana de caballos de fuerza *Horsepower*
median(base_carros$Horsepower)

# Moda de caballos de fuerza *Horsepower*
mode <- function(x) {
  return(as.numeric(names(which.max(table(x)))))
}

mode(base_carros$Horsepower)

# Cuartiles de caballos de fuerza *Horsepower*
summary(base_carros$Horsepower)

# Percentiles 1,5,10 y 90,95 y 99
quantile(base_carros$Horsepower, probs=c(0.01, 0.05, 0.10, 0.9095, 0.99))

# Medidas de Variabilidad

# Rango

es_min = min(base_carros$EngineSize)
es_max = max(base_carros$EngineSize)
rango = es_max-es_min
rango

# Rango intercuantilico

cuartiles = quantile(base_carros$EngineSize, probs=c(0.25,0.5,0.75), type = 6)
cuartiles[3]-cuartiles[1]

# Varianza

var(base_carros$RPM)

# Desviación Estándar

sd(base_carros$RPM)

# Coeficiente de variación

sd(base_carros$RPM) / mean(base_carros$RPM) * 100