#' Tuberculosis Interventions Timeline
#'
#' A dataset containing a time of Tuberculosis interventions. Aggregated from multiple sources 
#' but based in part [this timeline](https://en.wikipedia.org/wiki/Timeline_of_tuberculosis).

#' @format A data frame with 11 rows and 5 variables.
#' \describe{
#'   \item{year}{Calendar year}
#'   \item{intervention}{The name of the intervention}
#'   \item{type}{Type of intervetion, such as antibitoic, vaccine or strategy}
#'   \item{line}{For antibiotics the order of precedance in which it is used}
#'   \item{detail}{Detail on the interventio}
#' }
"tb_interventions_timeline"
