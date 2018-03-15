#' Plot Historic Proportions of Pulmonary/Extra-Pulmonary TB
#'
#'
#' @description Exported from [tbinenglanddataclean](https://www.samabbott.co.uk/tbinenglanddataclean/).
#' @param df A dataframe, (defaults to using \code{tb_not_ew})
#' of historic TB notifications
#' @param return A logical indiciting if the plot should be printed or returned (defaults to \code{FALSE})
#' @return A ggplot2 plot of TB notifications over time, with a secondary zoomed plot from a specified date.
#' @export
#' @inheritParams plot_historic_tb_ew
#' @import magrittr
#' @import ggplot2
#' @import viridis
#' @importFrom dplyr mutate group_by
#' @importFrom tidyr gather
#' @importFrom scales percent
#' @examples
#'
#' plot_historic_prop_pul_tb()
plot_historic_prop_pul_tb <- function(df = tb_not_ew,
                                plot_theme = NULL,
                                colour_scale = NULL,
                                return = FALSE) {
  
  if (is.null(colour_scale)) {
    colour_scale <- scale_fill_viridis(discrete = TRUE)
  }
  
  if (is.null(plot_theme)) {
    plot_theme <- theme_minimal()
  }
  
  p <- df %>%
    mutate(Respiratory = respiratory,
           `Non-respiratory` = non_respiratory,
           Pulmonary = pulmonary,
           `Extra-Pulmonary` = extra_pulmonary,
           Year = year) %>%
    gather(key = "TB type", value = "Notifications", Respiratory,`Non-respiratory`, Pulmonary, `Extra-Pulmonary`) %>%
    group_by(year) %>% 
    mutate(total = sum(Notifications, na.rm = TRUE)) %>% 
    mutate(Proportion = Notifications/total) %>%
    ggplot(aes(x = Year, y = Proportion, fill = `TB type`)) +
    geom_bar(stat = "identity") +
    plot_theme +
    theme(legend.position = "bottom") +
    scale_y_continuous(labels = scales::percent) +
    colour_scale

  if (return) {
    return(p)
  }else{
    p
  }
}



