#' Otolith reading Makro
#'
#' Package to transform coordinates from imagePRO into distances
#'
#' Takes coordinates delivered by imagePRO and calculates age, hatch check width and ring
#' width for the otolith
#'
#' @param x output from imagePRO (x coordinate)
#' @param y output from imagePRO (y coordinate)
#' @param fish_no number of the fish or whatever chosen to identify them
#' @param sep the seperator for the file to be created (default is ";")
#' @export
#'
#' @examples
#' #rm(list = ls())
#' x <- oto_makro(x = example[,3], y = example[,4], fish_no = 1)
#' #returns a data.frame with ring_width and more
#' x$values
#' #returns the plot
#' x$plot
#'


oto_makro <- function(x, y, fish_no, sep = ";") {
  #changes x and y to numeric values
  check_fac <- function(x) {
    if(is.factor(x)) {
      x_ <- as.numeric(as.character(x))
    } else {
      x_ <- as.numeric(x)
    }
    return(x_)
  }
  x_ <- check_fac(x)
  y_ <- check_fac(y)
  #merges x_ and y_ to a dfr
  z <- data.frame(x = x_, y = y_)
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
  temp <- z[c(a:nrow(z)),]
  temp <- temp[order(temp$x),]
  z[c(a:nrow(z)),] <- temp
  #calculating distances with pythagoras
  c <- vector(mode = "integer", length = nrow(z))
  for(i in seq(from = 1, to = nrow(z))) {
    if(is.numeric(z$x[c(i:(i+1))])) {
      a <- z$x[i+1] - z$x[i]
      b <- z$y[i+1] - z$y[i]
      c[i] <- sqrt((a^2 + b^2))
    }
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
                  id = fish_no_)
  #forms the outline of the plot
  theme_standard <- function(){
    ggplot2::theme(
      text             = ggplot2::element_text(size = 8, face="bold"),
      title            = ggplot2::element_text(hjust = .5, size = 12),
      axis.title       = ggplot2::element_text(face="bold"),
      axis.title.x     = ggplot2::element_text(hjust = .5, size = 20, vjust = -1),
      axis.title.y     = ggplot2::element_text(hjust = .5, vjust = 1, size = 20),
      axis.text.x      = ggplot2::element_text(size = 20),
      axis.text.y      = ggplot2::element_text(size = 20),
      axis.line        = ggplot2::element_line(colour = "black"),
      panel.grid       = ggplot2::element_blank(),
      panel.border     = ggplot2::element_rect(fill = NA, colour = "black"),
      panel.background = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      strip.text.y     = ggplot2::element_text(angle = 0),
      legend.text      = ggplot2::element_text(size = 12)
    )}
  #creates the plot
  p1 <- ggplot2::ggplot(data = z, ggplot2::aes(x = ring_no, y = ring_width)) +
    ggplot2::geom_point() +
    ggplot2::geom_path() +
    theme_standard() +
    ggplot2::labs(x = "Ring_No", y = "Ring_Width", title = fish_no)

  res <- list(z, p1)
  names(res) <- c("values", "plot")
  print(p1)
  return(res)
}
