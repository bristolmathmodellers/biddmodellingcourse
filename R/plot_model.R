#' Plot Compartment Populations over Time for a Model Simulation
#' 
#' @description Make seperate plots for each model compartment. Assumes model output is structured
#' as that produced from \code{\link[biddmodellingcourse]{solve_ode}}.
#' @param sim A tibble of model output as formated by \code{\link[biddmodellingcourse]{solve_ode}}
#' @param facet Logical, defaults to \code{TRUE}. If \code{FALSE} then the plot will not be facetted
#' otherwise it will be.
#' @param interactive Logical, defaults to \code{FALSE}. If \code{TRUE} produces an interative plot.
#' @return A Plot of each model compartments population over time.
#' @importFrom plotly ggplotly
#' @import ggplot2
#' @import viridis
#' @importFrom tidyr gather
#' @export
#'
#' @examples
#' 
#'## Intialise
#'N = 100000
#'I_0 = 1
#'S_0 = N - I_0
#'R_0 = 1.1
#'beta = R_0
#'
#' ##Time for model to run over
#'tbegin = 0
#'tend = 50
#'times <- seq(tbegin, tend, 1)
#'
#' ##Vectorise input
#'parameters <- as.matrix(c(beta = beta))
#'inits <- as.matrix(c(S = S_0, I = I_0))
#'
#'sim <- solve_ode(model = SI_ode, inits, parameters, times, as.data.frame = TRUE)
#'
#'plot_model(sim, facet = FALSE, interactive = FALSE)
#'
#'plot_model(sim, facet = TRUE, interactive = FALSE)

plot_model <- function(sim, facet = TRUE, interactive = FALSE) {
  
  order <- colnames(sim)[-1] 
  
  plot <- sim %>% 
    gather(key = "Compartment", value = "Population", -time) %>% 
    mutate(Compartment = factor(Compartment, levels = order)) %>% 
    ggplot(aes(x = time, y = Population, col = Compartment)) +
    geom_line() +
    theme_minimal() +
    labs(x = "Year") +
    scale_color_viridis(discrete = TRUE, end = 0.9)
  
  if (facet) {
    plot <- plot +
      theme(legend.position = "none") + 
      facet_wrap(~Compartment)
  }

  
  if (interactive) {
    ggplotly(plot)
  }else{
    plot
  }
}