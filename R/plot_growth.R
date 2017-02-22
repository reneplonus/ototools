#' Fish growth
#'
#' Plotting ring width
#'
#' Plots ring width ~ julian day, should not include more than 12 fish and works with the output
#' from comb_func
#'
#' @param data a dfr given by comb_func
#' @param y_var y variable for a geom_line plot
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- "example"
#' format <- "csv"
#' data <- master_func(fish = fish, format = format, sep = ";", basic = gathering, catch_day = "catch_date")
#' plot_growth(data = data)
#'

plot_growth <- function(data, y_var = "ring_width") {
  # p <- ggplot2::ggplot(data = data, ggplot2::aes_(x = lazyeval::interp(~var, var = as.name("julday")), lazyeval::interp(~var, var = as.name("ring_width")))) +
  p <- ggplot2::ggplot(data = data, ggplot2::aes_(x = ~julday, lazyeval::interp(~var, var = as.name(y_var)))) +
    ggplot2::geom_line() +
    ggplot2::facet_wrap(~id) +
    plot_outline()
  return(p)
}
