#' Move_ave
#'
#' Calculat the difference in moving averages following Huessy et al. 2003
#'
#' Calculating the difference of the moving average from the last 10 increments and the next
#' 10 increments. Returns absolut values.
#'
#' @param ring_no colname of the column with ring numbers
#' @param ring_width colname of the column with ring widths
#' @param data dfr with both ring_no and ring_width
#' @export
#'
#' @examples
#' #rm(list = ls())
#' data <- oto_makro(x = example[,3], y = example[,4], fish_no = 1)
#' move_ave("ring_no", "ring_width", data)

move_ave <- function(ring_no, ring_width, data) {
  moving_ave <- vector(mode = "integer", length = nrow(data))
  for(i in 1:nrow(data)) {
    #for ring_no 5 to 9
    if(data[i, ring_no] < 10 & data[i, ring_no] > 4) {
      moving_ave[i] <- mean(data[1:i, ring_width]) - mean(data[i:(i+9), ring_width])
    } else {
      ifelse(data[i, ring_no] > (nrow(data) - 9) & data[i, ring_no] < (nrow(data) - 3),
             #for the last 10 rings (excluding the last 4 rings)
             yes = moving_ave[i] <- mean(data[(i-9):i, ring_width]) - mean(data[i:nrow(data), ring_width]),
             #for all rings between 9 and (max - 10)
             no = moving_ave[i] <- if(i > 4 & i < (nrow(data) - 8)) {mean(data[(i-9):i, ring_width]) - mean(data[i:(i+9), ring_width])}
                                                               #for the first and last 4 rings
                                                               else {moving_ave[i] <- NA})
    }
  }
  return(abs(moving_ave))
}
