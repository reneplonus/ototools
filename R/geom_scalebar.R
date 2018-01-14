#' geom_scalebar
#'
#' Creates a scale bar in a ggplot
#'
#' Uses geom_segment to create a black and white scale bar in horizontal direction.
#' Is not able to give any information about the magnification itself!
#' The exact length of the scale bar has to be known.
#'
#' @param range A vector with two values. Giving the limits in x direction.
#' It doesn't matter which value comes first (if it's not important which colour the first segment has).
#' @param y Value for vertical positioning.
#' @param segments Specifies the number of segments between lower and upper range.
#' @param size Specifies the width of the scale bar.
#' @export
#'
#' @examples
#' #rm(list = ls())
#' ggplot2::ggplot(data = NULL, ggplot2::aes(x = c(2,5), y = c(3, 1))) +
#'    ggplot2::geom_point() +
#'    geom_scalebar(range = c(2.5, 4.5), y = 2, segments = 4, size = 2)
#'
#' ggplot2::ggplot(data = NULL, ggplot2::aes(x = c(2,5), y = c(3, 1))) +
#'    ggplot2::geom_point() +
#'    geom_scalebar(range = c(4.5, 2.5), y = 2, segments = 4, size = 2)
#'

geom_scalebar <- function(range, y, segments, size) {
  scalebar <- function(range, y, segments, size) {
    scale_x <- seq(from = range[1], to = range[2], length.out = segments + 1)
    scale_bar <- data.frame(x = scale_x[2:length(scale_x) - 1],
                            y = y,
                            xend = scale_x[2:length(scale_x)],
                            yend = y,
                            colour = rep(c("black", "white"),length.out = length(scale_x) - 1),
                            size = size)
    return(scale_bar)
  }
  return(ggplot2::geom_segment(data = scalebar(range = range, y = y, segments = segments, size = size),
                               ggplot2::aes(x = x, y = y, xend = xend, yend = yend),
                               colour = scalebar(range = range, y = y, segments = segments, size = size)$colour,
                               size = scalebar(range = range, y = y, segments = segments, size = size)$size))
}
