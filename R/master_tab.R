#' master_tab
#'
#' Merges objects of a list.
#'
#' Uses rbind() to connect all elements of a given list in one object.
#' Works only with data arranged in columns.
#'
#' @param x list with dfrs/ tibbles / ...
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- list(x = makro_output, x = makro_output)
#' master_tab(x)
#'

master_tab <- function(x) {
  if(any(purrr::map_lgl(x, ~ncol(.) != ncol(x[[1]])))) stop("All dfrs must have as much columns as the first one.")
  temp <- x[[1]]
  for(i in 2:length(x)) {
    temp <- rbind(temp, x[[i]], deparse.level = 0)
  }
  return(temp)
}
