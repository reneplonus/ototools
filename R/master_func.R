#' Master function
#'
#' Run some functions of ototools
#'
#' Uses load_fish + oto_makro + master_tab. If basic is given, it will merge basic to the mastertable
#' with comb_func. If catch_day is given it will add julday and moving average. Returns a dfr.
#'
#' @param fish name of the files to be loaded
#' @param format format of the files to be loaded (either txt or csv);
#'               has to be the same for every file, default is txt
#' @param sep the separator used by the files to be loaded;
#'            has to be the same for every file, default is tab
#' @param basic a dfr with some basic values for the fish
#' @param catch_day name of the column containing the catch day (julian)
#' @param dir path to the folder to be worked in
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- c("example", "example")
#' format <- "csv"
#' sep <- ";"
#' basic <- basic[, names(basic) != "age"]
#' catch_day <- "catch_date"
#'
#' x <- master_func(fish = fish, format = format, sep = sep,
#'                  basic = basic, catch_day = catch_day, dir = "F:/ototools")
#' x
#'
#' x <- master_func(fish = fish, format = format, sep = sep, dir = "F:/ototools")
#' x
#'

master_func <- function(fish, format = "txt", sep = "\t", basic = NULL, catch_day = NULL, dir = getwd()) {
  #load in more fish with the same format and run the makro
  fish_list <- purrr::map(fish, ~load_fish(fish = ., format = format, sep = sep, dir = dir))
  x         <- purrr::map(1:length(fish), ~oto_makro(x_coord = fish_list[[.]][,3], y_coord = fish_list[[.]][,4], fish_no = fish[.]))
  x <- master_tab(x)
  if(!is.null(basic)) {
    x <- comb_func(x, basic)
  }
  if(!is.null(catch_day)) {
    if(!is.numeric(x[,catch_day][[1]])) {
      if(!is.integer(x[,catch_day][[1]])) stop("Catch_day has to be either of type numeric or integer")
    }
    x$julday <- purrr::map2_dbl(.x = unlist(x[, catch_day]), .y = x$age, .f = ~.x - .y)
    x$julday <- purrr::map2(.x = x$ring_no, .y = x$julday, .f = ~.x + .y + 1)
  }
  x$move_ave <- purrr::map2(.x = x$ring_no, .y = x$ring_width, .f = ~move_ave(.x, .y))
  return(x)
}
