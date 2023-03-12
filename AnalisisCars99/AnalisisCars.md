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
* Este comando lee un archivo CSV llamado "dataset-83422.csv" y lo carga en un objeto de R llamado "base_carros". El archivo CSV debe estar en la misma ubicación que el script de R desde donde se está ejecutando este comando. Una vez que se ha cargado el archivo CSV, se pueden realizar diversas operaciones en los datos utilizando el objeto "base_carros".

```
base_carros = read.csv("dataset-83422.csv")
```

[Ver Tabla](./TablaCars99.md)

## Frecuencias

### Frecuencia absoluta
* El código está calculando la frecuencia absoluta de la variable "Manufacturer" en un conjunto de datos llamado "base_carros". La función "table" crea una tabla de frecuencias para una variable dada, y en este caso, se está pasando como argumento la columna "Manufacturer" del conjunto de datos. La salida de este código es la tabla de frecuencias absolutas de la variable "Manufacturer", es decir, el número de veces que aparece cada valor de "Manufacturer" en el conjunto de datos.

```
frec_abs = table(base_carros$Manufacturer)
frec_abs
```

### Frecuencia relativa
* La función prop.table() en R se utiliza para calcular las frecuencias relativas de una tabla o matriz. En este caso, frec_abs es la tabla de frecuencias absolutas que se ha calculado previamente utilizando la función table(). La función prop.table(frec_abs) toma la tabla de frecuencias absolutas frec_abs y calcula las frecuencias relativas de cada valor en la tabla. El resultado es una tabla de frecuencias relativas que indica la proporción de veces que aparece cada valor en la variable.

```
frec_rel = prop.table(frec_abs)
frec_rel
```

### Tabla de frecuencias
* La función freq() pertenece al paquete descr y se utiliza para crear una tabla de frecuencias de una variable categórica. En este caso, se está aplicando esta función a la variable Manufacturer del conjunto de datos base_carros. Además, se especifica el argumento plot = TRUE para que se genere un gráfico de barras que muestre la distribución de frecuencias de la variable. La variable frec_tabla guarda el resultado de la función freq(), es decir, la tabla de frecuencias y el gráfico de barras.

```
par(col.axis = "#b5e853", bg="#000000e6", fg="#b5e853", col="#b5e853")
frec_tabla = freq(base_carros$Manufacturer, plot = TRUE)
frec_tabla
```
* #### Plot tabla de frecuencias
![Plot tabla de frecuencias](./src/img/PlotTablaFrecuencias.png)

## Gráficas de barras *ggplot2*

### Gráfica de barras frecuencia absoluta
* Este código en R utiliza la librería ggplot2 para crear un gráfico de barras de las frecuencias absolutas de una variable cualitativa llamada Manufacturer en un conjunto de datos llamado base_carros. La función geom_bar se utiliza para crear un gráfico de barras, donde se define el mapeo de datos para el eje x, que en este caso es el nombre de los fabricantes, utilizando la función aes que toma como argumento x = Manufacturer. No se especifica la altura de cada barra, por lo que por defecto se muestra la frecuencia absoluta de cada fabricante.

```
ggplot(data = base_carros) + 
  geom_bar(mapping = aes(x = Manufacturer, fill=Manufacturer))+
  theme(panel.background = element_rect(fill = "#000000e6"),
        plot.background = element_rect(fill = "#000000e6"),
        panel.grid.major = element_line(color = "#000000e6"),
        panel.grid.minor = element_line(color = "#000000e6"),
        axis.text = element_text(color = "#b5e853"),
        axis.title = element_text(color = "#b5e853"),
        legend.background = element_rect(fill = "#000000e6"),
        legend.text = element_text(color = "#b5e853"),
        legend.title = element_text(color = "#b5e853"),)
```
* #### ggplot barras frecuencia absoluta
![Plot Frecuencia Absoluta](./src/img/ggplotBarrasFrecuenciaAbsoluta.png)

### Gráfica de barras frecuencia relativa
* Este código está generando un gráfico de barras con las frecuencias relativas de los fabricantes de los carros en función del país de origen del fabricante.

  * La función ggplot() establece el conjunto de datos base_carros como el origen de los datos para el gráfico.
  * La función geom_bar() se utiliza para crear un gráfico de barras y el parámetro mapping se utiliza para asignar las variables estéticas a las columnas del conjunto de datos. En este caso, el eje x representa el fabricante, el eje y representa la frecuencia relativa de los fabricantes, el parámetro fill se utiliza para asignar el país de origen de cada fabricante al color de la barra y el parámetro group se utiliza para agrupar los datos por país de origen.
  * La función theme() se utiliza para establecer los aspectos de la apariencia del gráfico, como el color de fondo, los colores de las líneas de la cuadrícula, los colores del texto de los ejes y el color de fondo de la leyenda.
  * La función labs() se utiliza para establecer los títulos de los ejes y de la leyenda. En este caso, el título del eje x es "Manufacturer", el título del eje y es "Frecuencia relativa" y el título de la leyenda es "Origin".

```
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
```

* #### ggplot barras frecuencia relativa
![Plot Frecuencia Relativa](./src/img/ggplotBarrasFrecuenciaRelativa.png)

### Gráfica de barras frecuencia relativa ordenados por el número de caracteres en su nombre
* Este código genera una gráfica de barras que muestra la frecuencia relativa de los fabricantes de autos en la base de datos base_carros, ordenados por el número de caracteres en su nombre (usando la función fct_reorder del paquete forcats). Además, el color de las barras se define por la variable Origin de la base de datos. La leyenda correspondiente se agrega utilizando las funciones labs y theme, y se personalizan los colores del fondo, las líneas de la cuadrícula, los ejes y la leyenda.

* La advertencia que aparece indica que se eliminaron estéticas durante la transformación estadística, lo que podría deberse a una estructura de agrupación incorrecta en los datos. En este caso, es probable que la variable Origin no esté formateada correctamente como un factor en la base de datos.

```
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
```

* #### ggplot barras frecuencia relativa ordenados por el número de caracteres en su nombre
![Plot Frecuencia Relativa](./src/img/ggplotBarrasFrecuenciaRelativaSortName.png)

### Gráfica de barras frecuencia relativa y apila el tipo de airbag que utilizan
* Este código crea una gráfica de barras que muestra la frecuencia de fabricantes de autos en el eje x y el número de modelos que tienen bolsas de aire en el eje y. Cada barra está coloreada según si los modelos tienen o no bolsas de aire.

  * ggplot(data = base_carros) establece la fuente de datos para la gráfica como el dataframe base_carros.

  * geom_bar(mapping = aes(x = Manufacturer, fill = AirBags)) especifica que la gráfica tendrá barras y define dos mapeos estéticos: el eje x se asigna a Manufacturer y el relleno de las barras se asigna a AirBags.

  * theme(...) establece el tema de la gráfica. En este caso, establece el color de fondo, las líneas de la cuadrícula y los colores de los textos y de la leyenda.

```
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
```

* #### ggplot barras frecuencia relativa apilando tipo de airbag
![Plot Frecuencia Relativa Airbags](./src/img/ggplotBarrasFrecuenciaAirbag.png)

### Gráfica de barras proporcionales de fabricantes y tipos de automóvil
* Este código genera una gráfica de barras apiladas proporcionales que muestra la proporción de cada tipo de automóvil por fabricante en los datos de base_carros.

* En la función geom_bar, se utiliza el parámetro mapping para establecer la variable Manufacturer en el eje x y la variable Type en el relleno de las barras. El parámetro position se establece como "fill" para apilar las barras de manera proporcional en lugar de mostrarlas en paralelo.

* En la sección del tema, se establece el color de fondo del panel, la trama y las líneas de la cuadrícula, así como el color del texto de los ejes y la leyenda. También se establece el color de fondo de la leyenda y el color del texto de la leyenda.

```
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
```

* #### ggplot barras proporcionales de fabricantes y tipo de automóvil
![Plot Frecuencia Proporcional](./src/img/ggplotBarrasProporcionales.png)

## Gráficas circulares *ggplot2*

### Grafica circular de proporcion de fabricantes
* Este código genera un gráfico circular (o gráfico de rosca) que muestra la proporción de fabricantes de autos en una base de datos llamada resumen_manufacturer, utilizando el paquete ggplot2 de R.

* La función ggplot() inicia el gráfico, y se le pasa como primer argumento el nombre de la base de datos que contiene los datos a graficar (resumen_manufacturer). Luego, se utiliza la función aes() para indicar que el eje x no tiene variable asociada (x = ""), el eje y representa la proporción de fabricantes (y = prop), y el color de las barras representa los diferentes fabricantes (fill = Manufacturer).

* A continuación, se utiliza la función geom_bar() para indicar que se quiere un gráfico de barras (stat = "identity"), y la función coord_polar() para transformar el gráfico de barras en uno circular. Finalmente, se utilizan las funciones theme() y sus parámetros para ajustar la apariencia del gráfico (fondo, colores, líneas, textos, leyendas, etc.).

```
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
```

* #### ggplot circular porporcional de fabricantes
![Plot Circular Proporcional de Fabricantes](./src/img/ggplotCircularProporcionFabricantesAutos.png)

### Grafica polar de frecuencia de fabricantes
* Este código genera un gráfico de barras apiladas y polar. El eje x representa los diferentes fabricantes de automóviles y el eje y muestra la frecuencia de los mismos. El color de las barras representa el origen del fabricante. La función coord_polar() transforma el gráfico para que sea polar. Los elementos de la temática (theme()) se encargan de definir el estilo visual del gráfico, como el color de fondo, los colores de las líneas, texto y leyenda.

```
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
```
* #### ggplot polar frecuencia de fabricantes
![Plot Circular Polar de Frecuencia](./src/img/ggplotCircularPolarFrecuencia.png)

## Graficas histogramas

### Histogramas para 2 variables cuantitativas

* Este código utiliza la librería ggplot2 de R para generar un histograma 2D que muestra la distribución conjunta de las variables "Price" y "EngineSize" de la tabla "base_carros". La escala de color utilizada va desde el verde claro hasta el verde oscuro. Además, se utilizan opciones de formato para cambiar el color de fondo, la rejilla, los ejes y la leyenda, lo que permite mejorar la visualización del gráfico.

```
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
```
* #### ggplot histograma de Precio y Tamaño del Motor
![Plot Circular Polar de Frecuencia](./src/img/ggplotHisotgramaPriceEngineSize.png)
