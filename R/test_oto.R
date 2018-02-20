#' test_oto
#'
#' Quick check for one otolith.
#'
#' Uses load_fish + oto_makro + plot_growth. Returns a dfr and a plot.
#'
#' @param fish name of the file to be loaded
#' @param format format of the file to be loaded (either txt or csv); default is txt
#' @param sep the separator used by the file to be loaded; default is tab
#' @param dir working directory
#' @inheritParams load_fish2
#' @param add.plot Logical. If TRUE (default), a plot with ring width VS ring number will be
#' created additionally.
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- "708"
#' format <- "csv"
#' test_oto(fish = fish, format = format, sep = ";", dir = substr(getwd(), 1, 11))
#'

test_oto <- function(fish, format = "txt", sep = "\t", dir = getwd(), section = NULL, add.plot = TRUE) {
  #load in one fish and run the makro
  if(is.null(section)) {
    temp <- load_fish(fish = fish, format = format, sep = sep, dir = dir)
  } else {
    temp <- load_fish2(fish = fish, sep = sep, dir = dir, section = section)
  }
  x <- oto_makro(x_coord = temp$V3, y_coord = temp$V4, fish_no = fish)
  if(x$age > 0) {
    if(add.plot) {
      print(plot_growth(x_var = x$ring_no[[1]], y_var = x$ring_width[[1]]))
    }
  }
  return(x)
}
