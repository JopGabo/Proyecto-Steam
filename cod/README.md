# Código del análisis

Esta carpeta reúne los archivos fuente del estudio, escritos en R y Quarto.

## Archivos

- [`proyecto_steam_resumido.qmd`](proyecto_steam_resumido.qmd): fuente del informe final en PDF. Incluye importación, limpieza, unión por `appid`, construcción de la cohorte, Kaplan–Meier, log-rank, selección de casos y bibliografía.
- [`proyecto_steam_modulos_A_B.qmd`](proyecto_steam_modulos_A_B.qmd): avance anterior en HTML. Es material histórico: incluye análisis de Cox y otras decisiones que **no corresponden al alcance del informe final**. Sus rutas y recursos deben revisarse antes de intentar reproducirlo; entre ellos, el YAML hace referencia a `estilo_proyecto.css`, que no está en esta carpeta del repositorio.

## Requisitos para el informe final

Se necesitan R, Quarto, los paquetes de R `tidyverse` y `survival`, y XeLaTeX. En R se pueden instalar los paquetes con:

```r
install.packages(c("tidyverse", "survival"))
```

Coloca `steamcharts.csv` y `games_march2025_cleaned.csv` en `data/`, al mismo nivel que `cod/`. Consulta [las instrucciones de datos](../data/README.md) para obtener el segundo archivo. La ruta alternativa que aparece en el código corresponde a una copia de trabajo previa y puede no existir en otras computadoras.

## Generar el PDF

Desde la **raíz del repositorio**, en la terminal de RStudio:

```bash
quarto render cod/proyecto_steam_resumido.qmd --to pdf --output-dir ../res
```

La opción `--output-dir` se interpreta con relación al archivo de entrada cuando se renderiza este documento individual; por eso `../res` lleva de `cod/` a `res/`. Revisa la salida de la terminal si faltan paquetes, datos o XeLaTeX. Este comando puede sobrescribir `res/proyecto_steam_resumido.pdf` y no actualiza `docs/informe.pdf`.


