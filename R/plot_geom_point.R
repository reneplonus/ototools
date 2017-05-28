#' plot_geom_point
#'
#' Creates a ggplot with geom_point.
#'
#' Meant to create plots to display different correlations between measurements taken to evaluate the
#' growth of fish, but simply creates a geom_point based plot with the ototools specific frame.
#'
#' @param data a dfr holding x_var and y_var
#' @param x_var x variable for a geom_point plot
#' @param y_var y variable for a geom_point plot
#' @export
#'
#' @examples
#' #rm(list = ls())
#' plot_geom_point(data = basic, x_var = "oto_diameter", y_var = "tl_mm")
#' plot_geom_point(data = basic, x_var = "oto_weight_mg", y_var = "dry_weight_g")
#'

plot_geom_point <- function(data, x_var, y_var) {
  p <- ggplot2::ggplot(data = data, ggplot2::aes_(x = lazyeval::interp(~var, var = as.name(x_var)), lazyeval::interp(~var, var = as.name(y_var)))) +
    ggplot2::geom_point() +
    plot_outline()
  return(p)
}
