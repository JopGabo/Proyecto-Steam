# Persistencia de popularidad de videojuegos en Steam

**Autor:** Gabriel Jop Baltodano

Este proyecto estudia cómo cambia la popularidad de videojuegos en Steam después de su máximo observado. La popularidad se aproxima mediante el promedio mensual de jugadores concurrentes; no representa ventas, ingresos ni jugadores únicos. El análisis compara, de forma descriptiva y sin ajuste por otras características, juegos gratuitos y de pago, e incluye los casos de *Crush Crush* y *Terraria*.

## Pregunta y metodología

¿Cuánto tiempo transcurre desde el máximo promedio mensual observado hasta un declive sostenido de popularidad? El evento se confirma en el tercer mes de la primera racha de tres meses consecutivos con menos del 60 % del máximo propio. Si el evento no se observa durante el seguimiento, el juego se considera censurado.

El informe utiliza el estimador de Kaplan–Meier para describir la persistencia y la prueba log-rank para contrastar globalmente las curvas por modalidad de acceso. El análisis también presenta dos juegos elegidos mediante una regla reproducible. Las comparaciones son **no ajustadas** y no demuestran causalidad.

## Resultados y presentación

- [Informe final en PDF](res/proyecto_steam_resumido.pdf).
- [Presentación interactiva](https://jopgabo.github.io/Proyecto-Steam/).
- [PDF accesible desde la presentación](https://jopgabo.github.io/Proyecto-Steam/informe.pdf).

En la cohorte analizada, de 5.236 juegos, la probabilidad estimada de no haber presentado el evento a los 12 meses fue de 15,6 % para juegos gratuitos y 12,1 % para juegos de pago. Son estimaciones para las reglas y los datos del estudio, no tasas de retención de jugadores.

## Organización

| Carpeta o archivo | Contenido |
| --- | --- |
| [`cod/`](cod/) | Código Quarto del informe final y un avance anterior. |
| [`data/`](data/) | Datos mensuales disponibles en el repositorio e instrucciones para el archivo grande que se descarga aparte. |
| [`res/`](res/) | PDF del informe final. |
| [`docs/`](docs/) | Presentación web, PDF accesible desde ella y archivos relacionados. |
| [`docs/assets/`](docs/assets/) | Gráficos, imágenes, logo y QR usados por la presentación. |
| `ProyectoHerr.Rproj` | Archivo para abrir el proyecto en RStudio. |

Cada carpeta contiene un README con más información.

## Datos y reproducibilidad

El panel mensual utilizado abarca de julio de 2012 a septiembre de 2025. El archivo `steamcharts.csv` está incluido; `games_march2025_cleaned.csv` debe conseguirse por separado y colocarse en `data/`, porque por su tamaño no forma parte del repositorio público. Consulta [data/README.md](data/README.md) para conocer las fuentes y las precauciones sobre versiones.

Para ejecutar el informe se necesitan R, Quarto, los paquetes `tidyverse` y `survival`, y una instalación de LaTeX que incluya XeLaTeX. Con ambos CSV en `data/`, desde la raíz del repositorio:

```bash
quarto render cod/proyecto_steam_resumido.qmd --to pdf --output-dir ../res
```

El comando escribe el PDF en `res/` y puede sobrescribir el informe existente. La copia `docs/informe.pdf` que utiliza la presentación no se actualiza automáticamente. Consulta [cod/README.md](cod/README.md) para más detalles.

## Alcance y limitaciones

La cobertura de SteamCharts es selectiva; las series pueden tener meses faltantes y la censura puede ser informativa. La clasificación gratuita/de pago proviene del precio observado en el catálogo y no necesariamente coincide con el precio al lanzamiento. Los casos se eligieron para contrastar trayectorias, por lo que no representan al conjunto de juegos ni permiten conocer la demografía real de sus jugadores.

Las fuentes completas y la bibliografía se encuentran en el informe.
