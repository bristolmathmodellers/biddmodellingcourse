#' Plot Historic TB Notifications in England and Wales
#'
#' @description Exported from [tbinenglanddataclean](https://www.samabbott.co.uk/tbinenglanddataclean/).
#' @param df A dataframe, (defaults to using \code{tb_not_ew})
#' of historic TB notifications
#' @param df_interventions A dataframe, (defaults to using \code{tb_interventions_timeline})
#' of TB interventions, focussing on there history in the UK. If passed as \code{NULL} no interventions will be plotted.
#' @param zoom_date_start Numeric, the year to filter notifications from for the second zoomed plot.
#' @param zoom_date_end Numeric, the year to end the zoom window, defaults to the final year of the data.
#' @param plot_theme The ggplot2 theme to use, defaults to \code{\link[ggplot2]{theme_minimal}}.
#' @param colour_scale The colour scale to plot with, defaults to \code{\link[ggplot2]{scale_colour_viridis_d}}
#' @param return A logical indiciting if the plot should be printed or returned (defaults to \code{FALSE})
#' @return A ggplot2 plot of TB notifications over time, with a secondary zoomed plot from a specified date.
#' @export
#' @import ggplot2
#' @import viridis
#' @importFrom dplyr mutate bind_rows data_frame full_join rename summarise
#' @importFrom tidyr gather
#' @importFrom scales extended_breaks
#' @examples
#' plot_historic_tb_ew()
plot_historic_tb_ew <- function(df = biddmodellingcourse::tb_not_ew,
                                df_interventions = biddmodellingcourse::tb_interventions_timeline,
                                zoom_date_start = 1982,
                                zoom_date_end = NULL,
                                plot_theme = NULL,
                                colour_scale = NULL,
                                return = FALSE) {
  
  if (is.null(zoom_date_end)) {
    zoom_date_end <- max(df$year)
  }
  
  if (!is.null(df_interventions)) {
   df <- df %>% 
     full_join(df_interventions %>% 
                 mutate(type = factor(type)), by = "year") %>% 
     rename(`Intervention type` = type) %>% 
     rename(Intervention = intervention)
  }else{
    df$Intervention <- NA
  }
  
  if (!is.null(zoom_date_start)) {
    df_zoom <- df %>%
      filter(year >= zoom_date_start, year <= zoom_date_end) %>%
      mutate(zoom = "")
    df <- df %>%
      mutate(zoom = " ")

    df <- df %>%
      bind_rows(df_zoom) %>%
      mutate(zoom = factor(zoom, levels = c(" ", "")))
  }else{
    df$zoom <- " "
  }
  
  if (is.null(colour_scale)) {
    colour_scale <- scale_colour_viridis(discrete = TRUE)
  }
  
  if (is.null(plot_theme)) {
    plot_theme <- ggplot2::theme_minimal()
  }
  
  df_plot <- df %>%
    rename(Respiratory = respiratory,
           `Non-respiratory` = non_respiratory,
           Pulmonary = pulmonary,
           `Extra-pulmonary` = extra_pulmonary,
           Year = year) %>%
    gather(key = "TB type", value = "Notifications", 
           Respiratory,`Non-respiratory`, Pulmonary, `Extra-pulmonary`) %>% 
    mutate(`TB type` = factor(`TB type`,
                                  levels = c("Respiratory",
                                             "Non-respiratory",
                                             "Pulmonary",
                                             "Extra-pulmonary"))
           )
  

  if (!is.null(zoom_date_start)) {
    max_not_facet <- df_plot %>% 
    group_by(zoom) %>% 
      summarise(Notifications = max(Notifications, na.rm = TRUE))
    
    zoom_dim <- data_frame(y_min = 0, x_min = zoom_date_start - 0.5, 
                           y_max = pull(max_not_facet, Notifications),
                           x_max = zoom_date_end + 0.5, 
                           zoom = pull(max_not_facet, zoom))
  }

  if (!is.null(df_interventions)) {
    p <- df_plot %>%
      ggplot(aes(x = Year, y = Notifications, label = Intervention))
  }else{
    p <- df_plot %>%
      ggplot(aes(x = Year, y = Notifications))
  }
  
  if (!is.null(zoom_date_start)) {
    p <- p + geom_rect(data = zoom_dim, aes(ymax = y_max, xmax = x_max, ymin = y_min, xmin = x_min,
                                            xintercept = NULL, linetype = NULL, label = NULL,
                                            x = NULL, y = NULL), alpha = 0.05, fill = "blue")
  }
  
  if (!is.null(df_interventions)) {
    p <- p + 
      geom_vline(data = filter(df_plot, !is.na(`Intervention type`)), aes(xintercept = Year, linetype = `Intervention type`), alpha = 0.6)
  }
  
  p <- p +
    geom_line(aes(col = `TB type`, linetype = NULL), size = 1.2, show.legend = c(linetype = FALSE)) +
    plot_theme +
    colour_scale +
    scale_x_continuous(breaks = scales::extended_breaks(n = 10)) +
    theme(legend.position = "bottom", 
          legend.justification = "center",
          legend.box = "horizontal") +
    guides(col = guide_legend(nrow = 2))

  if (!is.null(zoom_date_start)) {
    p <- p + facet_wrap(~zoom, scales = "free", ncol = 1)
  }
  
  if (!is.null(df_interventions)) {
    p <- p + guides(linetype = guide_legend(nrow = 2))
  }
  
  if (return) {
    return(p)
  }else{
    p
  }
}
