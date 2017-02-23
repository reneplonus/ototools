#' Plot outline
#'
#' Gives a frame for plots
#'
#' Gives plots created with ototools a specific outline.
#'
#' @examples
#' #rm(list = ls())
#'

plot_outline <- function(){
  ggplot2::theme(
    axis.text.x      = ggplot2::element_text(size = 12, colour = "black"),
    axis.text.y      = ggplot2::element_text(size = 12, colour = "black"),
    axis.line        = ggplot2::element_line(colour = "black"),
    panel.grid       = ggplot2::element_blank(),
    panel.border     = ggplot2::element_rect(fill = NA, colour = "black"),
    panel.background = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank())
}
