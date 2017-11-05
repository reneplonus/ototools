#' plot_growth
#'
#' Creates a ggplot with geom_line.
#'
#' Meant to plot the growth of a fish based on otlith analysis,
#' but simply creates a geom_line based plot with the ototools specific frame.
#'
#' @param x_var x variable for a geom_line plot
#' @param y_var y variable for a geom_line plot
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x_var <- dat$julday
#' y_var <- dat$ring_width
#' p <- purrr::map2(x_var, y_var, ~plot_growth(x_var = .x, y_var = .y))
#' p[[1]] + ggplot2::labs(x = "Julday", y = "Ring_width")
#' purrr::map2(p, list(c(1,2)), ~.x + ggplot2::geom_hline(yintercept = .y))
#'

plot_growth <- function(x_var, y_var) {
  p <- ggplot2::ggplot(data = NULL, ggplot2::aes_(x = x_var, y = y_var)) +
    ggplot2::geom_line() +
    ggplot2::labs(x = "", y = "") +
    plot_outline()
  return(p)
}
