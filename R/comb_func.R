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
#' y <- basic
#' y$age <- as.numeric(y$age)
#' combi <- comb_func(x = x, y = y, by = c("id", "age"))
#'

comb_func <- function(x, y, by = "id") {
  for(i in 1:length(by)) {
    if (class(x[, by[i]][[1]]) != class(y[, by[i]])) stop(paste0("Column types not identical in x and y. ",
                                                           by[i], " in x is ", class(x[, by[i]][[1]]),
                                                           " while ", by[i], " in y is ", class(y[, by[i]])))
  }

  z <- dplyr::left_join(x, y, by = by)
  return(z)
}
