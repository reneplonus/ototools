#' calc_mean_growth
#'
#' Calculate the mean growth of n fish.
#'
#' bla
#'
#' @param
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- master_tib$julday
#' y <- master_tib$ring_width
#' calc_mean_growth(x, y)
#'

calc_mean_growth <- function(x, y) {
  dat <- cbind(unlist(x), unlist(y), deparse.level = 0)
  julday <- unique(dat[, 1])
  mean_growth <- purrr::map_dbl(julday, ~mean(dat[dat[, 1] == ., 2], na.rm = TRUE))
  se_growth   <- purrr::map_dbl(julday,   ~sd(dat[dat[, 1] == ., 2], na.rm = TRUE))

  out <- data.frame(julday = julday,
                    mean_growth = mean_growth,
                    se_growth = se_growth)
  return(out)
}
