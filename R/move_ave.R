#' Move_ave
#'
#' Calculate the difference in moving averages following Huessy et al. 2003
#'
#' Calculating the difference of the moving average from the last 10 increments and the next
#' 10 increments. Returns absolut values.
#'
#' @param ring_no column with ring numbers
#' @param ring_width column with ring widths
#' @export
#'
#' @examples
#' #rm(list = ls())
#' dat <- oto_makro(x = example[,3], y = example[,4], fish_no = 1)
#' ring_no <- dat$ring_no[[1]]
#' ring_width <- dat$ring_width[[1]]
#' move_ave(ring_no, ring_width)

move_ave <- function(ring_no, ring_width) {
  x <- length(ring_no)
  moving_ave <- vector(mode = "integer", length = x)
  for(i in 1:x) {
    #for ring_no 5 to 9
    if(ring_no[i] < 10 & ring_no[i] > 4) {
      moving_ave[i] <- mean(ring_width[1:i]) - mean(ring_width[i:(i + i - 1)])
    } else {
      ifelse(ring_no[i] > (x - 9) & ring_no[i] < (x - 3),
             #for the last 10 rings (excluding the last 4 rings)
             yes = moving_ave[i] <- mean(ring_width[(i - (x - i)):i]) - mean(ring_width[i:x]),
             #for all rings between 9 and (max - 10)
             no = moving_ave[i] <- if(i > 4 & i < (x - 8)) {mean(ring_width[(i-9):i]) - mean(ring_width[i:(i+9)])}
                                                               #for the first and last 4 rings
                                                               else {moving_ave[i] <- NA})
    }
  }
  return(abs(moving_ave))
}
