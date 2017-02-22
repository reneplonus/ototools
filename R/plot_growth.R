#' Fish growth
#'
#' Plotting ring width
#'
#' Plots ring width ~ julian day, should not include more than 12 fish and works with the output
#' from comb_func
#'
#' @param data a dfr given by comb_func
#' @param catch_day name of the column containing the catch day (julian)
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- oto_makro(x = example[,3], y = example[,4], fish_no = "example")
#' y <- gathering
#' data <- comb_func(x = x, y = y)
#' catch_day <- "catch_date"
#' plot_growth(data = data, catch_day = catch_day)
#'

plot_growth <- function(data, catch_day, y_var = "ring_width") {
  data$julday <- data[,catch_day] - data[,5] + data[,1] + 1
  # p <- ggplot2::ggplot(data = data, ggplot2::aes_(x = lazyeval::interp(~var, var = as.name("julday")), lazyeval::interp(~var, var = as.name("ring_width")))) +
  p <- ggplot2::ggplot(data = data, ggplot2::aes_(x = ~julday, lazyeval::interp(~var, var = as.name(y_var)))) +
    ggplot2::geom_line() +
    ggplot2::facet_wrap(~id) +
    plot_outline()
  return(p)
}
