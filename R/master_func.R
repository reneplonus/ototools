#' master_func
#'
#' Runs some functions of ototools.
#'
#' Uses load_fish + oto_makro + master_tab for a list with n filenames.
#' If basic is given, it will merge basic to the mastertable created by master_tab.
#' If catch_day is given it will add julday in addition to ring_no.
#' Will automatically add the moving average based on the method published by Huessy et al. 2003.
#' Will automatically calculate the otolith radius at increment x.
#'
#' @param fish name of the files to be loaded
#' @param format format of the files to be loaded (either txt or csv);
#'               has to be the same for every file, default is txt
#' @param sep the separator used by the files to be loaded;
#'            has to be the same for every file, default is tab
#' @param basic a dfr with some basic measurements for the fish analysed
#' @param catch_day name of the column containing the catch day in julian days
#' @param dir path to a folder common to all elements of fish as well as basic
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- c("708", "708")
#' format <- "csv"
#' sep <- ";"
#' test <- basic[, names(basic) != "age"]
#' catch_day <- "deathday"
#'
#' x <- master_func(fish = fish, format = format, sep = sep,
#'                  basic = test, catch_day = catch_day, dir = "F:/ototools")
#' x
#'
#' x <- master_func(fish = fish, format = format, sep = sep, dir = "F:/ototools")
#' x
#'

master_func <- function(fish, format = "txt", sep = "\t", basic = NULL, catch_day = NULL, dir = getwd(), section = NULL) {
  #load in more fish with the same format and run the makro
  if(is.null(section)) {
    fish_list <- purrr::map(fish, ~load_fish(fish = ., format = format, sep = sep, dir = dir))
  } else {
    fish_list <- purrr::map2(fish, section, ~load_fish2(fish = .x, sep = sep, dir = dir, section = .y))
  }
  x <- purrr::map(1:length(fish), ~oto_makro(x_coord = fish_list[[.]][,3], y_coord = fish_list[[.]][,4], fish_no = fish[.]))
  #create 1 tibble
  x <- master_tab(x)
  #merge with another tibble
  if(!is.null(basic)) {
    x <- comb_func(x, basic)
  }
  #calculate julian days
  if(!is.null(catch_day)) {
    if(!is.numeric(x[,catch_day][[1]])) {
      if(!is.integer(x[,catch_day][[1]])) stop("Catch_day has to be either of type numeric or integer")
    }
    x$julday <- purrr::map2_dbl(.x = unlist(x[, catch_day]), .y = x$age, .f = ~.x - .y)
    x$julday <- purrr::map2(.x = x$ring_no, .y = x$julday, .f = ~.x + .y + 1)
  }
  #calculate a moving average
  x$move_ave <- purrr::map2(.x = x$ring_no, .y = x$ring_width, .f = ~move_ave(.x, .y))
  #calculate otolith radius at increment x
  x$cum_oto_rad <- purrr::map2(.x = x$ring_width, .y = x$hc, .f = ~sum_rows(.x) + .y)
  return(x)
}
