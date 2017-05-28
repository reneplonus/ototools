#' plot_hatch
#'
#' Creating a ggplot with geom_bar.
#'
#' Meant to create a histogram of the hatch dates,
#' but simply creates a histogram with the ototools specific frame.
#'
#' @param values days of hatch
#' @param xlab titel of xaxis, default is Hatch_day
#' @export
#'
#' @examples
#' #rm(list = ls())
#' values <- basic$catch_date - basic$age
#' plot_hatch(values = values)
#'

plot_hatch <- function(values, xlab = "Hatch_day") {
  p <- ggplot2::ggplot(data = NULL, ggplot2::aes(x = values)) +
    ggplot2::geom_bar() +
    ggplot2::geom_abline(intercept = 0, slope = 0) +
    ggplot2::xlab(xlab) +
    plot_outline()
  return(p)
}




