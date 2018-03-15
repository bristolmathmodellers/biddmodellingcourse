#' Tuberculosis Notifications in England and Wales
#'
#' A dataset containing notified Tuberculosis cases from 1913 to 2016. This dataset was made available
#' by Public Health England and is available [here](https://www.gov.uk/government/publications/tuberculosis-tb-annual-notifications-1913-onwards).
#' @format A data frame with 102 rows and 4 variables.
#' \describe{
#'   \item{year}{Calendar year}
#'   \item{respiratory}{The number of respiratory cases starting from 1913 and ending in 1981}
#'   \item{non_respiratory}{The number of non-respiratory cases starting from 1913 and ending in 1981}
#'   \item{pulmonary}{The number of pulmonary cases (with or without extra-pulomnary disease), starting from 1982}
#'   \item{extra_pulmonary}{The number of extra-pulmonary cases, starting from 1982}
#' }
"tb_not_ew"
