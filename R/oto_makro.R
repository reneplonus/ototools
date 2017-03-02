#' Otolith reading Makro
#'
#' Function to deliver the distances between coordinates from imagePRO
#'
#' The function was created to deal with the output from imagePRO. It simply applies the
#' Pythagoras' theorem between each line and the folling one of a given dfr.
#' Returns a dfr with the folloing values: ring_no, ring_width, hc, oto_rad, age and id.
#'
#' @param x_coord a vector that will be converted to numeric, is supposed to be x coordinates
#'                from imagePRO
#' @param y_coord a vector that will be converted to numeric, is supposed to be y coordinates
#'                from imagePRO
#' @param fish_no number of the fish or whatever chosen to identify different individual
#' @export
#'
#' @examples
#' #rm(list = ls())
#' #returns a data.frame with ring_width and more
#' x <- oto_makro(x_coord = example[,3], y_coord = example[,4], fish_no = 1)
#' head(x)
#'


oto_makro <- function(x_coord, y_coord, fish_no) {
  check_fac <- function(x) {
    if(is.factor(x)) {
      x_ <- as.numeric(as.character(x))
    } else {
      x_ <- as.numeric(x)
    }
    return(x_)
  }
  x_ <- check_fac(x_coord)
  y_ <- check_fac(y_coord)
  #merges x_ and y_ to a dfr
  z <- data.frame(x = x_, y = y_)
  z <- rbind(z, c(NA, NA))
  a <- 1
  #sorting the coodinates from left to right
  for(i in seq(from = 1, to = nrow(z))) {
    if(is.na(z[i, 1])) {
      temp <- z[c(a:(i-1)),]
      temp <- temp[order(temp$x),]
      z[c(a:(i-1)),] <- temp
      a <- i+1
    }
  }
  #calculating distances with pythagoras
  c <- vector(mode = "integer", length = nrow(z))
  for(i in seq(from = 1, to = nrow(z))) {
      a <- z$x[i+1] - z$x[i]
      b <- z$y[i+1] - z$y[i]
      c[i] <- sqrt((a^2 + b^2))
  }
  #creating a data.frame with all relevant values
  c <- subset(x = c, c != "NA")
  hc <- rep(x = c[1], times = length(c) - 2)
  ring_no <- seq(from = 1, to = length(c) - 2)
  ring_width <- c[2:(length(c) - 1)]
  age <- rep(x = length(c) - 1, times = length(c) - 2)
  oto_rad <- rep(x = sum(c), times = length(c) - 2)
  fish_no_ <- rep(x = fish_no, times = length(c) - 2)
  z <- data.frame(ring_no = ring_no,
                  ring_width = ring_width,
                  hc = hc,
                  oto_rad = oto_rad,
                  age = age,
                  id = fish_no_,
                  stringsAsFactors = FALSE)

  return(z)
}
