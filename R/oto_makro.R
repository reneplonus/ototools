#' oto_makro
#'
#' Otolith reading makro.
#'
#' The function was created to deal with the output from imagePRO. It simply applies the
#' Pythagoras' theorem between each line and the folling one of two vectors.
#' Returns a tibble with the folloing values: ring_no, ring_width, hc, oto_rad, age and id.
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
#' oto_makro(x_coord = example[,3], y_coord = example[,4], fish_no = 708)
#'

oto_makro <- function(x_coord, y_coord, fish_no) {
  check_input <- function(x) {
    if(substr(x[1], 1, 1) == " ") {
      x <- substr(x, 2, max(nchar(x)))
    }
    if(grepl(",", x[1])) {
      x <- strsplit(x, split = ",")
      for(i in 1:length(x)) {
        x[i] <- paste0(x[[i]][1], ".", x[[i]][2])
      }
      x <- as.matrix(x)
    }
    if(is.factor(x)) {
      x_ <- as.numeric(as.character(x))
    } else {
      x_ <- as.numeric(x)
    }
    return(x_)
  }
  x_ <- suppressWarnings(check_input(x_coord))
  y_ <- suppressWarnings(check_input(y_coord))
  #merges x_ and y_ to a dfr
  z <- data.frame(x = x_, y = y_)
  z <- rbind(z, c(NA, NA))
  a <- 1
  #sorting the coodinates from left to right
  for(i in seq(from = 1, to = nrow(z))) {
    if(is.na(z[i, 1]) | z[i, 1] == 0) {
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
  hc <- c[1]
  ring_no <- seq(from = 1, to = length(c) - 2)
  ring_width <- c[2:(length(c) - 1)]
  age <- length(c) - 1
  oto_rad <- sum(c)
  fish_no_ <- fish_no
  z <- tibble::tibble(id = fish_no_,
                      ring_no = list(ring_no),
                      ring_width = list(ring_width),
                      hc = hc,
                      oto_rad = oto_rad,
                      age = age)
  return(z)
}
