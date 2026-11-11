# Presentación interactiva

Esta carpeta contiene la presentación web del proyecto y el informe al que dirige su código QR.

- [Abrir la presentación publicada](https://jopgabo.github.io/Proyecto-Steam/).
- [Abrir el informe publicado](https://jopgabo.github.io/Proyecto-Steam/informe.pdf).

## Uso local y navegación

Abre `index.html` en un navegador moderno y conserva `assets/` junto a ese archivo. Las diapositivas y recursos incluidos funcionan sin conexión; los enlaces a fuentes y al informe publicado necesitan internet.

Avanza con los botones inferiores o las flechas izquierda y derecha. Las teclas Inicio y Fin llevan a la primera y última diapositiva; el botón ⛶ o la tecla F permite usar pantalla completa cuando el navegador lo admite. En pantallas pequeñas se puede desplazar verticalmente cada diapositiva y deslizar horizontalmente para navegar.


## Archivos

- `index.html`: contenido y estructura.
- `app.js`: controles, navegación y respuestas interactivas.
- `styles.css`, `projection.css` y `versus.css`: diseño y adaptación a pantalla.
- [`assets/`](assets/): gráficos, imágenes de juegos, logo de Steam y QR. Sus fuentes están documentadas en [assets/README.md](assets/README.md).
- `informe.pdf`: copia del informe a la que apunta el QR. No se sincroniza automáticamente con `res/`.
- `generar_graficos.R`: script utilizado para reconstruir los gráficos de la presentación en la copia de trabajo original.

**Limitación del script:** en la estructura actual del repositorio, `generar_graficos.R` busca `Individual_Jop_HerramientasDatosI_2026.qmd` en la carpeta superior, pero el archivo fuente del repositorio se llama `cod/proyecto_steam_resumido.qmd`. Por ello no se puede ejecutar sin adaptar y verificar esa ruta. La presentación ya incluye los PNG y no necesita R ni los CSV para abrirse.


