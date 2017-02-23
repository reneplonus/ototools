#' Comb_func
#'
#' Combines two dfrs
#'
#' Does a left_join with two dfrs. Will merge by id as default.
#' Can possibly not merge by more than one column.
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
  if (class(x[, by]) != class(y[, by])) stop(paste0("Column types not identical in x and y.",
                                                    by, " in x is ", class(x[, by]),
                                                    " while ", by, " in y is ", class(y[, by])))
  z <- dplyr::left_join(x, y, by = by)
  return(z)
}
