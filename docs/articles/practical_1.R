## ----packages, include = FALSE-------------------------------------------
library(tidyverse)
library(tbinenglanddataclean)
library(prettypublisher)

## ----plot-incidence, echo = FALSE, message = FALSE, warning = FALSE, dpi= 300, fig.height = 10, fig.width = 10, fig.cap = pretty_figref("incidence_tb", caption = "TB notifications in England and Wales from 2013 to 2016, stratified initially by respiratory/non-respiratory status and from 1982 by pulmonary/non-pulmonary TB. Interventions are highlighted with vertical lines, with linetype denoting the type of intervention.")----
tbinenglanddataclean::plot_historic_tb_ew()

