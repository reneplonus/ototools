#' sum_rows
#'
#' Summarise each row with the rows before
#'
#' Initially meant to calculate the otolith radius at increment x.
#' If you need it otherwise, go for it.
#'
#' @param x a vector containing values that should be summarised.
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- dat$ring_width[[1]]
#'

sum_rows <- function(x) {
  out <- NULL
  for(i in seq_along(x)) {
    out[i] <- sum(x[1:i], na.rm = TRUE)
  }
  return(out)
}
