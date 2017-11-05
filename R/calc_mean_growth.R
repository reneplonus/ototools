#' calc_mean_growth
#'
#' Calculate the mean growth of n fish.
#'
#' Calculate the mean growth of n fish for each julian day. Returns mean and standard deviation.
#'
#' @param x variable to group y
#' @param y vector/ list of vectors with numeric values the same length as x
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- dat$julday
#' y <- dat$ring_width
#' test <- calc_mean_growth(x, y)
#'

calc_mean_growth <- function(x, y) {
  dat <- cbind(unlist(x), unlist(y), deparse.level = 0)
  julday <- sort(unique(dat[, 1]), decreasing = FALSE)
  mean_growth <- purrr::map_dbl(julday, ~mean(dat[dat[, 1] == ., 2], na.rm = TRUE))
  sd_growth   <- purrr::map_dbl(julday,   ~sd(dat[dat[, 1] == ., 2], na.rm = TRUE))

  out <- data.frame(julday = julday,
                    mean_growth = mean_growth,
                    sd_growth = sd_growth)
  return(out)
}
