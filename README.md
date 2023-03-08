# Analisis CARS99

## Instalación de paquetes necesarios
* La función install.packages("MASS") se utiliza para instalar el paquete MASS. Esta función descarga e instala el paquete en la biblioteca de R.
* Las funciones library() se utilizan para cargar los paquetes previamente instalados en la sesión actual. Los paquetes MASS, descr, ggplot2 y forcats se utilizan comúnmente en el análisis y visualización de datos.
```
install.packages("MASS")
library(MASS)
library(descr)
library(ggplot2)
library(forcats)
```

## Lectura del conjunto de datos
Este comando lee un archivo CSV llamado "dataset-83422.csv" y lo carga en un objeto de R llamado "base_carros". El archivo CSV debe estar en la misma ubicación que el script de R desde donde se está ejecutando este comando. Una vez que se ha cargado el archivo CSV, se pueden realizar diversas operaciones en los datos utilizando el objeto "base_carros".
```
base_carros = read.csv("dataset-83422.csv")
```



## Frecuencia absoluta

### Cálculo de tabla de frecuencias
frec_abs = table(base_carros$Manufacturer)
frec_abs

### Frecuencia relativa
frec_rel = prop.table(frec_abs)
frec_rel

# Tabla de frecuencias con gráfico
frec_tabla = freq(base_carros$Manufacturer, plot = TRUE)
frec_tabla

## Gráfica de Barras GGPLOT2

# Gráfica de Barras variables cualitativas
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer))

# Gráfica de barras con frecuencias relativas
# El código utiliza el paquete ggplot2 para crear una gráfica de barras con las 
# frecuencias relativas de los fabricantes de carros en el dataset base_carros. 
# La función geom_bar() es usada para crear una gráfica de barras, donde se 
# define el mapeo de datos para el eje x, que en este caso es el nombre de los 
# fabricantes, y el eje y es la frecuencia relativa de cada fabricante. 
# El argumento stat(prop) es utilizado para indicar que la altura de cada barra 
# debe ser proporcional a la frecuencia relativa de cada fabricante.
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer, y = stat(prop), group = 1))

# Grafica de barras que muestra la proporción de una variable categórica (Manufacturer).
# La función fct_reorder() de la librería forcats se utiliza para ordenar las categorías por longitud.
# La función stat(prop) para mostrar la proporción en lugar del recuento.
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = fct_reorder(Manufacturer,Manufacturer,length), y = stat(prop), group = 1))
