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
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- "708"
#' format <- "csv"
#' test_oto(fish = fish, format = format, sep = ";", dir = "F:/ototools")
#'

test_oto <- function(fish, format = "txt", sep = "\t", dir = getwd()) {
  #load in one fish and run the makro
  temp <- load_fish(fish = fish, format = format, sep = sep, dir = dir)
  x <- oto_makro(x_coord = temp$V3, y_coord = temp$V4, fish_no = fish)
  print(plot_growth(x_var = x$ring_no[[1]], y_var = x$ring_width[[1]]))
  return(x)
}
