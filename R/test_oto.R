#' test_oto
#'
#' Run some functions of ototools
#'
#' Uses load_fish + oto_makro + plot_growth. Returns a dfr and a plot.
#'
#' @param fish name of the file to be loaded
#' @param format format of the file to be loaded (either txt or csv)
#' @param sep the separator used by the file to be loaded
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- "example"
#' format <- "csv"
#' x <- test_oto(fish = fish, format = format, sep = ";")
#' head(x)

test_oto <- function(fish, format, sep) {
  #load in one fish and run the makro
  temp <- load_fish(fish = fish, format = format, sep = sep)
  x <- oto_makro(x_coord = temp$V3, y_coord = temp$V4, fish_no = fish)
  print(plot_growth(x, x_var = "ring_no"))
  return(x)
}
