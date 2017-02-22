#' master_tab
#'
#' Merges dfrs
#'
#' Does a rbind() for a list of dfr given by oto_makro
#'
#' @param x list of dfrs given by oto_makro
#' @export
#'
#' @examples
#' #rm(list = ls())
#'

master_tab <- function(x) {
  temp <- x[[1]]$values
  for(i in 2:length(x)) {
    temp <- rbind(temp, x[[i]]$values)
  }
  return(temp)
}
