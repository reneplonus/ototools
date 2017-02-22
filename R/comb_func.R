#' Comb_func
#'
#' Plotting ring width
#'
#' Plots ring width ~ julian day, should not include more than 12 fish and works with the output
#' from master_tab
#'
#' @param x a mastertable given by oto_makro
#' @param y a dfr with information you want to join to the mastertable
#' @param by by which vector should the dfrs be joined, default is id (must be present in both dfrs!)
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- oto_makro(x = example[,3], y = example[,4], fish_no = "example")
#' x$id <- as.character(x$id)
#' y <- gathering
#' combi <- comb_func(x = x, y = y)
#'

comb_func <- function(x, y, by = "id") {
  if (class(x[, by]) != class(y[, by])) stop("Column types not identical in x and y.")
  # x_[,by] <- as.character(x[,by])
  # y_[,by] <- as.character(y[,by])
  z <- dplyr::left_join(x, y, by = by)
  return(z)
}
