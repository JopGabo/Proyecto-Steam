# Popularidad y persistencia de videojuegos en Steam — presentación

Presentación navegable basada en el informe `Version5.pdf`. No necesita instalación ni conexión para mostrar las diapositivas: abre `index.html` en un navegador moderno y conserva la carpeta `assets` junto al archivo. La conexión solo es necesaria para abrir las fuentes externas.

## Navegación

Usa los botones de la parte inferior o las flechas izquierda y derecha; Inicio y Fin llevan a la primera y última diapositiva. El botón ⛶ o la tecla F activa la pantalla completa cuando el navegador lo permite. En pantallas pequeñas se puede desplazar verticalmente cada diapositiva y deslizar horizontalmente entre ellas. La lista de fuentes se despliega en la diapositiva de conclusiones.

## Archivos

- `index.html`: contenido y estructura.
- `styles.css`: diseño y adaptación a pantalla.
- `app.js`: navegación, controles y pantalla completa.
- `assets/kaplan-meier.png` y `assets/trayectorias.png`: gráficos reproducidos desde los datos del proyecto.
- `assets/crush-crush.jpg` y `assets/terraria.jpg`: portadas oficiales tomadas de las fichas de Steam de [Crush Crush](https://store.steampowered.com/app/459820/Crush_Crush/) y [Terraria](https://store.steampowered.com/app/105600/Terraria/). Derechos de las imágenes correspondientes a sus titulares.
- `assets/qr-informe.png`: código QR para el informe PDF publicado directamente en GitHub Pages. El enlace también aparece junto al código en la diapositiva de conclusiones.
- `generar_graficos.R`: script opcional para regenerar los gráficos; requiere R, tidyverse, survival y el archivo fuente Quarto en la carpeta superior, además de los datos en las rutas que ese archivo utiliza. La presentación terminada no necesita R ni los datos para abrirse.

El paisaje y los elementos gráficos decorativos son ilustraciones originales hechas con CSS y caracteres. Las portadas proceden de las fichas oficiales de Steam. Las fuentes de datos, fichas y documentación están enlazadas en la diapositiva final. Los resultados describen la cohorte y las comparaciones no ajustadas; no establecen causalidad.
