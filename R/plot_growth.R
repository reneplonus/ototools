#' Fish growth
#'
#' Plotting ring width ~ julday on default
#'
#' Creates a ggplot with geom_line, should not include more than 12 fish if id is TRUE.
#' Can be used to create other geom_line plots. Returns the plot.
#'
#' @param x_var x variable for a geom_line plot
#' @param y_var y variable for a geom_line plot
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- c("example", "example")
#' format <- "csv"
#' x_var <- master_tib$julday
#' y_var <- master_tib$ring_width
#' p <- purrr::map2(x_var, y_var, ~plot_growth(x_var = .x, y_var = .y))
#' p[[1]] + ggplot2::labs(x = "Julday", y = "Ring_width")
#' purrr::map2(p, c(1,2), ~.x + ggplot2::geom_hline(yintercept = .y))
#'

plot_growth <- function(x_var, y_var) {
  p <- ggplot2::ggplot(data = NULL, ggplot2::aes_(x = x_var, y = y_var)) +
    ggplot2::geom_line() +
    ggplot2::labs(x = "", y = "") +
    plot_outline()
  return(p)
}
