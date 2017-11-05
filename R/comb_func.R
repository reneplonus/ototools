#' comb_data
#'
#' Combine two tables.
#'
#' Performs a left_join with two datasets. Will merge by id as default, but can merge by every other
#' column as well.
#'
#' @param x a tibble given by oto_makro
#' @param y additional informations for (each) fish in x
#' @param by columns to be joined by.
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- oto_makro(x = example[,3], y = example[,4], fish_no = "708")
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
