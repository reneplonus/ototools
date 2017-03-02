#' master_tab
#'
#' Merges dfrs
#'
#' Does a rbind() for a list of dfrs. Returns the final dfr.
#'
#' @param x list of dfrs
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- list(x = "a", x = "a")
#' master_tab(x)
#'

master_tab <- function(x) {
  if(any(ncol(x) != ncol(x[[1]]))) stop("All dfrs must have as much columns as the first one.")
  temp <- x[[1]]
  for(i in 2:length(x)) {
    temp <- rbind(temp, x[[i]], deparse.level = 0)
  }
  return(temp)
}
