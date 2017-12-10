#' adjust_age
#'
#' Adjusts the number of rings.
#'
#' If the counting of rings does not start at the hatch check, this function adjusts the values given by
#' \link{oto_makro}.
#'
#' @param x an output from \link{oto_makro} to be corrected
#' @param value a vector with values tp be added to ring_no
#' @param mean a vector with values to be matched with hc
#' @param sd a vector indicating the possible error of the values given in mean
#' @param data instead of passing value, mean and sd you can simply pass a dfr including all three values.
#' In that case, names is needed.
#' @param names a character vector of length 3 indicating which column in data represents which argument
#' needed in adjust_rings (value, mean, sd)
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- makro_output
#' data <- data.frame(ring_no = c(1:10),
#'                    mean = sort(seq(from = 5, to = 15, length.out = 10) + runif(10, -1, 1)),
#'                    sd = runif(10, 0, 2))
#' names <- c("ring_no", "mean", "sd")
#' #using data:
#' adjust_age(x, data = data, names = names)
#' #without using data:
#' adjust_age(x, data$ring_no, data$mean, data$sd)
#'

adjust_age <- function(x, value = NULL, mean = NULL, sd = NULL, data = NULL, names = NULL) {

  #check input
  if(!is.null(data)) {
    value <- data[,names[1]]
    mean <- data[,names[2]]
    sd <- data[,names[3]]
  }

  #get false HC
  hc <- x$hc

  #get sd for value
  mean_plus <- as.vector(mean + sd)
  mean_minus <- as.vector(mean - sd)

  diff_plus <- NULL
  diff_minus <- NULL

  for(i in seq_along(mean_plus)) {
    diff_plus[i] <- value[max(which(mean < mean_plus[i]))] - value[i]
    diff_minus[i] <- value[i] - value[suppressWarnings(max(which(mean < mean_minus[i])))]
  }
  sd_value <- purrr::map2_dbl(diff_plus, diff_minus, ~round(mean(c(.y, .x), na.rm = TRUE), digits = 0))

  #match hc with mean
  matching_value <- max(which(mean < hc))

  #update x
  x$hc <- as.numeric(NA)
  x$ring_no <- purrr::map2(x$ring_no, list(value[matching_value]), ~.x + .y)
  x$age <- x$age + value[matching_value]

  #warning, if sd_value for matching_value is greater than 5% of age
  if(sd_value[matching_value] > (.05 * x$age)) {
    warning(paste0("The possible error for ", x$id, " exceeds 5% of the respective age!"))
  }

  #return x
  return(x)
}
