#' Plot Compartment Populations over Time for a Model Simulation
#' 
#' @description Make seperate plots for each model compartment. Assumes model output is structured
#' as that produced from \code{\link[biddmodellingcourse]{solve_ode}}.
#' @param sim A tibble of model output as formated by \code{\link[biddmodellingcourse]{solve_ode}}
#' @param facet Logical, defaults to \code{TRUE}. If \code{FALSE} then the plot will not be facetted
#' otherwise it will be.
#' @param prev_sim A second tibble of model output formated as for \code{sim}. Used to compare to model runs.
#' @param model_labels A character vector of model names, defaults to \code{c("Current", "Previous")}.
#' @param interactive Logical, defaults to \code{FALSE}. If \code{TRUE} produces an interative plot.
#' @return A Plot of each model compartments population over time.
#' @importFrom plotly plotly_build
#' @import ggplot2
#' @import viridis
#' @importFrom tidyr gather
#' @importFrom dplyr mutate bind_rows
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
#'
#'## Compare with an updated model run
#'
#'#'## Intialise
#'R_0 = 1.3
#'beta = R_0
#'parameters <- as.matrix(c(beta = beta))
#'
#'new_sim <- solve_ode(model = SI_ode, inits, parameters, times, as.data.frame = TRUE)
#'
#'
#'plot_model(new_sim,sim, facet = FALSE, interactive = FALSE)
#'
#'plot_model(new_sim, sim, facet = TRUE, interactive = FALSE)

plot_model <- function(sim, prev_sim = NULL, model_labels = NULL,
                       facet = TRUE, interactive = FALSE) {

  ## Define default lables for multiple models
  if (is.null(model_labels)) {
    model_labels <- c("Current", "Previous")
  }
  
  gather_columns_for_plot <- function(sim){
    order <- colnames(sim)[-1] 
    
    tidy_sim <- sim %>% 
      gather(key = "Compartment", value = "Population", -time) %>% 
      mutate(Compartment = factor(Compartment, levels = order))
    
    return(tidy_sim)
  }

  tidy_sim <- gather_columns_for_plot(sim)
  
  ## Add in previous model simulation if present
  if (!is.null(prev_sim)) {
    if ("data.frame" %in% class(prev_sim)) {
      prev_sim <-  gather_columns_for_plot(prev_sim)
      
      tidy_sim <- tidy_sim %>% 
        mutate(Model = model_labels[1]) %>% 
        bind_rows(prev_sim %>% 
                    mutate(Model = model_labels[2])) %>% 
        mutate(Model = factor(Model, levels = model_labels))
    }else{
      stop("prev_sim must be a model simulation dataframe or not be specified.")
    }
  }
  
 if (!is.null(prev_sim)) {
    plot <- ggplot(tidy_sim, aes(x = time, y = Population, col = Compartment, linetype = Model))
  }else{
    plot <- ggplot(tidy_sim, aes(x = time, y = Population, col = Compartment))
  }
  
  plot <- plot +
    geom_line() +
    theme_minimal() +
    labs(x = "Year") +
    scale_color_viridis(discrete = TRUE, end = 0.9)
  
  if (facet) {
    plot <- plot +
      facet_wrap(~Compartment)
    
    if (!is.null(prev_sim)) {
      plot <- plot +
        theme(legend.position = "bottom") +
        guides(col = FALSE)
    }else{
      plot <- plot +
        theme(legend.position = "none")
    }
  }

  ## Add facetting for previous simulation
  if (!facet && !is.null(prev_sim)) {
    plot <- plot +
      theme(legend.position = "bottom") + 
      facet_wrap(~Model)
  }
  
  if (interactive) {
    plot <- plotly_build(plot)
    plot$elementId <- NULL
    
    plot
  }else{
    plot
  }
}