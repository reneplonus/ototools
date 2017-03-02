#' Master function
#'
#' Run some functions of ototools
#'
#' Uses load_fish + oto_makro + master_tab + comb_func and adds julday if possible.
#' Returns a dfr.
#'
#' @param fish name of the files to be loaded
#' @param format format of the files to be loaded (either txt or csv);
#'               has to be the same for every file
#' @param sep the separator used by the files to be loaded;
#'            has to be the same for every file
#' @param basic a dfr with some basic values for the fish
#' @param catch_day name of the column containing the catch day (julian)
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- c("example", "example")
#' format <- "csv"
#' x <- master_func(fish = fish, format = format, sep = ";",
#'                  basic = gathering, catch_day = "catch_date")
#'


master_func <- function(fish, format, sep, basic, catch_day) {
  #load in more fish with the same format and run the makro
    x <- fish_list <- vector(mode = "list", length = length(fish))
    for(i in seq(from = 1, to = length(fish), by = 1)) {
      fish_list[[i]] <- load_fish(fish = fish[i], format = format, sep = sep)
      temp <- as.data.frame(fish_list[[i]])
      x[[i]] <- oto_makro(x_coord = temp$V3, y_coord = temp$V4, fish_no = fish[i])
    }
    x <- master_tab(x)
    x <- comb_func(x, basic)
    if(!is.numeric(x[,catch_day])) {
      if(!is.integer(x[,catch_day])) stop("Catch_day has to be either of type numeric or integer")
    }
    x$julday <- x[,catch_day] - x[,5] + x[,1] + 1
    x$move_ave <- NA
    for(i in unique(x$id)) {
      x$move_ave[which(x$id == i)] <- move_ave("ring_no", "ring_width", x[which(x$id == i),])
    }
    return(x)
}




