#' mean_
#'
#' Generic function for the arithmetic mean of a list or vector.
#'
#' Calculates the mean for a vector (just like mean()) or list (adding unlist() before calculating
#' the mean). Can also create a mean for different groups with 'group' and will apply unlist() and
#' unique() to 'group' beforehand so 'group' as well can be a list. If 'se' is not NULL (the default)
#' the standard deviation is calculated and multiplied with the value given in 'se' (1 = sd; 1.96 = CI).
#' The output will be a tibble with one, two or three columns depending on which parameters are given initially.
#' If 'group' is given, there will be rows equaling the number of unique values in 'group' instead of 1.
#'
#' @param x A vector or list with values. For more details see \link{mean}.
#' @param group A vector or list with values giving groups for which a mean shall be calculated.
#' Default is NULL. Will arrange the groups in an increasing order.
#' @param sd A numeric value. If not NULL (the default) se() will be used and the result will be multiplied
#' with the given value. This way, 1 means the standard deviation while it can also be used to calculate the
#' confidence intervals (1.96).
#' @param ... further arguments possible for mean() or sd().
#' @export
#'
#' @examples
#' #rm(list = ls())
#' group <- c(2, 2, 2, 1, 1, 1)
#' x <- c(1, 2, 3, 4, 5, 6)
#' sd <- 1
#' test <- mean_(x, group, sd)
#'

mean_ <- function(x, group = NULL, sd = NULL, ...) {
  #check if x is a list
  if(is.list(x)) {
    x_ <- unlist(x)
  } else {
    x_ <- x
  }
  #check if groups are given
  if(!is.null(group)) {
    group_ <- unlist(group)
  } else {
    group_ <- 1
  }
  #calculate the mean value for each group (if given)
  mean_x <- purrr::map_dbl(as.list(unique(group_)), ~mean(x_[group_ == .], ...))

  #create output tibble
  out <- tibble::tibble(mean = mean_x)
  #add groups if given
  if(!is.null(group)) {
    out$group <- unique(group_)
    out <- subset(out, select = c(2, 1))
    out <- dplyr::arrange(.data = out, group)
  }
  #add sd if given
  if(!is.null(sd)) {
    out$sd <- purrr::map_dbl(as.list(sort(unique(group_), decreasing = FALSE)), ~sd(x_[group_ == .], ...)) * sd
    if(sd != 1) {
      names(out)[3] <- paste0("sd_x_", sd)
    }
  }
  return(out)
}
