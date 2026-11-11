# Popularidad y persistencia de videojuegos en Steam — presentación

Presentación navegable basada en el informe `Version5.pdf`. No necesita instalación ni conexión para mostrar las diapositivas: abre `index.html` en un navegador moderno y conserva la carpeta `assets` junto al archivo. La conexión solo es necesaria para abrir las fuentes externas.

## Navegación

Usa los botones de la parte inferior o las flechas izquierda y derecha; Inicio y Fin llevan a la primera y última diapositiva. El botón ⛶ o la tecla F activa la pantalla completa cuando el navegador lo permite. En pantallas pequeñas se puede desplazar verticalmente cada diapositiva y deslizar horizontalmente entre ellas. La lista de fuentes se despliega en la diapositiva de conclusiones. En las dos preguntas al público usa «Mostrar respuesta» para revelar los resultados después de la votación; el mismo botón permite volver a ocultarlos. En la diapositiva de declive, usa «Avanzar ejemplo» para mostrar los tres meses uno a uno.

## Archivos

- `index.html`: contenido y estructura.
- `styles.css`, `projection.css` y `versus.css`: diseño, colores de alto contraste y adaptación a pantalla.
- `app.js`: navegación, controles y pantalla completa.
- `assets/kaplan-meier.png` y `assets/trayectorias.png`: gráficos reproducidos desde los datos del proyecto.
- `assets/crush-crush.jpg` y `assets/terraria.jpg`: portadas oficiales tomadas de las fichas de Steam de [Crush Crush](https://store.steampowered.com/app/459820/Crush_Crush/) y [Terraria](https://store.steampowered.com/app/105600/Terraria/). Derechos de las imágenes correspondientes a sus titulares.
- `assets/qr-informe.png`: código QR para el informe PDF publicado directamente en GitHub Pages. El enlace también aparece junto al código en la diapositiva de conclusiones.
- `generar_graficos.R`: script opcional para regenerar los gráficos; requiere R, tidyverse, survival y el archivo fuente Quarto en la carpeta superior, además de los datos en las rutas que ese archivo utiliza. La presentación terminada no necesita R ni los datos para abrirse.

Las portadas y el logo proceden de recursos oficiales de Steam. Las fuentes de datos, fichas y documentación están enlazadas en la diapositiva final. Los resultados describen la cohorte y las comparaciones no ajustadas; no establecen causalidad.

## Créditos de recursos visuales

- Identidad de Steam: [recursos y guía de marca de Valve](https://partner.steamgames.com/doc/marketing/branding?language=english).
- Portadas: [Crush Crush](https://store.steampowered.com/app/459820/Crush_Crush/), [Terraria](https://store.steampowered.com/app/105600/Terraria/), [Portal 2](https://store.steampowered.com/app/620/Portal_2/), [Stardew Valley](https://store.steampowered.com/app/413150/Stardew_Valley/) y [Hollow Knight](https://store.steampowered.com/app/367520/Hollow_Knight/), servidas por Steam. Las portadas adicionales son ilustrativas y no identifican casos analizados.
- Ilustración de Journey’s End: [anuncio oficial de Terraria en Steam](https://store.steampowered.com/news/app/105600/view/2205019689483334899).

Las imágenes y marcas pertenecen a sus respectivos titulares; sus créditos no implican afiliación o patrocinio. Para exponer, comprueba el contraste y el tamaño del texto en el proyector y salón reales.
