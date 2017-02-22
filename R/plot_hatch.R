#' Hatch histogram
#'
#' Creating a histogram
#'
#' Creating a histogram of the hatch dates
#'
#' @param values days of hatch in julian days
#' @param xlab Titel of xaxis, default is Hatch_day
#' @export
#'
#' @examples
#' #rm(list = ls())
#' values <- gathering$catch_date - gathering$age
#' plot_hatch(values = values)
#'

plot_hatch <- function(values, xlab = "Hatch_day") {
  p <- ggplot2::ggplot(data = NULL, ggplot2::aes(x = values)) +
    ggplot2::geom_bar() +
    ggplot2::geom_abline(intercept = 0, slope = 0) +
#    ggplot2::expand_limits(y = 0) +
    ggplot2::xlab(xlab) +
    plot_outline()
  return(p)
}




