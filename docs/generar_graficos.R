# Regenera los gráficos desde el análisis Quarto y sus datos, sin cambiar el informe.
# Ejecutar: Rscript generar_graficos.R desde esta carpeta.
args <- commandArgs(trailingOnly = FALSE)
script <- sub("^--file=", "", args[grepl("^--file=", args)][1])
carpeta <- dirname(normalizePath(script))
proyecto <- dirname(carpeta)
setwd(proyecto)
fuente <- readLines("Individual_Jop_HerramientasDatosI_2026.qmd", encoding = "UTF-8")
inicio <- which(fuente == "```{r}")[1]
fin <- which(fuente == "```" & seq_along(fuente) > inicio)[1]
eval(parse(text = fuente[(inicio + 1):(fin - 1)]), envir = .GlobalEnv)

tema <- theme_minimal(base_size = 18) + theme(
  plot.background = element_rect(fill = "#101827", color = NA),
  panel.background = element_rect(fill = "#101827", color = NA),
  panel.grid.major = element_line(color = "#536172", linewidth = 0.35),
  panel.grid.minor = element_blank(),
  axis.text = element_text(color = "#e1e9ef", size = 16),
  axis.title = element_text(color = "#f8fafc", size = 17),
  legend.text = element_text(color = "#f8fafc", size = 17),
  legend.position = "top", legend.title = element_blank(),
  plot.margin = margin(12, 18, 12, 12)
)

# El primer punto de cada curva es S(0)=1; las cruces marcan censuras observadas.
km_tabla <- tibble(
  tiempo = km$time, supervivencia = km$surv, censuras = km$n.censor,
  grupo = sub("f2p_label=", "", rep(names(km$strata), km$strata))
)
km_tabla <- bind_rows(km_tabla, distinct(km_tabla, grupo) |>
  mutate(tiempo = 0, supervivencia = 1, censuras = 0)) |> arrange(grupo, tiempo)
grafico_km <- ggplot(km_tabla, aes(tiempo, supervivencia, color = grupo)) +
  geom_vline(xintercept = 12, linetype = "dotted", color = "#f8fafc", linewidth = .6) +
  geom_step(aes(linetype = grupo), linewidth = 1.35) +
  geom_point(data = filter(km_tabla, censuras > 0), shape = 3, size = 2, stroke = .7) +
  scale_color_manual(values = c("De pago" = "#ffd166", "Free-to-Play" = "#6de5d0")) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1), breaks = seq(0, 1, .25)) +
  scale_x_continuous(breaks = seq(0, 80, 10)) +
  labs(x = "Meses desde el máximo observado", y = NULL) + tema

grafico_casos <- ggplot(casos_panel, aes(meses, retention_ratio, color = game_name_chart)) +
  geom_hline(yintercept = .6, linetype = "dashed", color = "#f8fafc", linewidth = .6) +
  geom_line(aes(linetype = game_name_chart), linewidth = 1.35) +
  geom_point(data = filter(casos_panel, event_observed, month_date == event_month), size = 3) +
  scale_color_manual(values = c("Crush Crush" = "#ffadc2", "Terraria" = "#6de5d0")) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1.05), breaks = seq(0, 1, .25)) +
  scale_x_continuous(breaks = seq(0, 70, 10)) +
  labs(x = "Meses desde el máximo de cada juego", y = NULL) + tema

ggsave(file.path(carpeta, "assets", "kaplan-meier.png"), grafico_km,
       width = 10, height = 4.7, dpi = 180, bg = "#101827")
ggsave(file.path(carpeta, "assets", "trayectorias.png"), grafico_casos,
       width = 10, height = 4.5, dpi = 180, bg = "#101827")
