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
#'
#' x <- master_func(fish = fish, format = format, sep = sep,
#'                  basic = gathering, catch_day = "catch_date", dir = "F:/ototools")
#' head(x)
#'
#' x <- master_func(fish = fish, format = format, sep = sep, dir = "F:/ototools")
#' head(x)
#'

master_func <- function(fish, format = "txt", sep = "\t", basic = NULL, catch_day = NULL, dir = getwd()) {
  #load in more fish with the same format and run the makro
  fish_list <- purrr::map(fish, ~load_fish(fish = ., format = format, sep = sep, dir = dir))
  x         <- purrr::map(1:length(fish), ~oto_makro(x_coord = fish_list[[.]][,3], y_coord = fish_list[[.]][,4], fish_no = fish[.]))
    # x <- fish_list <- vector(mode = "list", length = length(fish))
    # for(i in seq(from = 1, to = length(fish), by = 1)) {
    #   fish_list[[i]] <- load_fish(fish = fish[i], format = format, sep = sep, dir = dir)
    #   temp <- as.data.frame(fish_list[[i]])
    #   x[[i]] <- oto_makro(x_coord = temp$V3, y_coord = temp$V4, fish_no = fish[i])
    # }
    x <- master_tab(x)
    if(!is.null(basic)) {
      x <- comb_func(x, basic)
    }
    if(!is.null(catch_day)) {
      if(!is.numeric(x[,catch_day])) {
        if(!is.integer(x[,catch_day])) stop("Catch_day has to be either of type numeric or integer")
      }
      x$julday <- x[,catch_day] - x[,5] + x[,1] + 1
      x$move_ave <- NA
      for(i in unique(x$id)) {
        x$move_ave[which(x$id == i)] <- move_ave("ring_no", "ring_width", x[which(x$id == i),])
      }
    }
    return(x)
}




