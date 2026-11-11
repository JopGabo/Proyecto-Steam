# Datos del proyecto

El análisis une dos conjuntos por el identificador de aplicación de Steam (`appid`). Los datos se utilizan con fines descriptivos; sus condiciones de uso y descarga deben revisarse en cada fuente.

## Archivos necesarios

| Archivo esperado | Contenido utilizado | Disponibilidad |
| --- | --- | --- |
| `steamcharts.csv` | Series mensuales, incluido el promedio de jugadores concurrentes, e identificador del juego. | Incluido en este repositorio. 


| `games_march2025_cleaned.csv` | Características del catálogo, entre ellas identificador, nombre, fecha de lanzamiento, precio, categorías y género. | No se incluye en Git por su tamaño; debe colocarse manualmente en esta carpeta. |

En el archivo mensual del análisis, el período observado va de julio de 2012 a septiembre de 2025. La cobertura depende de los juegos y meses disponibles en la fuente.

## Fuentes

- [Steam Monthly Average Players, Kaggle](https://www.kaggle.com/datasets/lunthu/steam-monthly-average-players): fuente compatible con el archivo mensual utilizado. La coincidencia de identidad se basa en la documentación disponible; no se verificó igualdad binaria con una descarga actual.
- [Steam Games Dataset 2025, versión 2, Kaggle](https://www.kaggle.com/datasets/artermiloff/steam-games-dataset/versions/2): fuente identificada para el catálogo. Busca el archivo `games_march2025_cleaned.csv` en la versión correspondiente y colócalo en esta carpeta con ese nombre.

Las bases públicas pueden actualizarse. Para reproducir exactamente las cifras del informe se necesitan las mismas versiones y archivos utilizados en el estudio; una descarga diferente o modificada podría cambiar la cohorte, los resultados y los juegos seleccionados. Si el archivo esperado no aparece o la descarga no coincide, revisa la documentación y compara columnas antes de ejecutar el análisis. La fecha exacta de descarga y la igualdad binaria de las fuentes no se han confirmado.

## Archivo grande y Git

El catálogo local pesa aproximadamente 447 MiB y está incluido en `.gitignore` para evitar subirlo accidentalmente.
```

