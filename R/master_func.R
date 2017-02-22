#' Master function
#'
#' Run some func of ototools
#'
#' Uses load_fish + oto_makro + master_tab
#'
#' @param fish name of the file(s) to be loaded
#' @param format format of the file(s) to be loaded (either txt or csv);
#' has to be the same for every file
#' @param sep the separator used by the file(s) to be loaded;
#' has to be the same for every file
#' @param basic a dfr with some basic values for the fish
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- "example"
#' format <- "csv"
#' x <- master_func(fish = fish, format = format, sep = ";", basic = gathering)
#'


master_func <- function(fish, format, sep, basic) {
  #load in one fish and run the makro
  if(length(fish) == 1) {
    temp <- load_fish(fish = fish, format = format, sep = sep)
    x <- oto_makro(x = temp$V3, y = temp$V4, fish_no = fish)$values
  }
  #load in more fish with the same format and run the makro
  else {
    x <- fish_list <- vector(mode = "list", length = length(fish))
    for(i in seq(from = 1, to = length(fish), by = 1)) {
      fish_list[[i]] <- load_fish(fish = fish[i], format = format, sep = sep)
      temp <- as.data.frame(fish_list[[i]])
      x[[i]] <- oto_makro(x = temp$V3, y = temp$V4, fish_no = fish[[i]][1])
    }
    x <- master_tab(x)
  }
  x <- comb_func(x, basic)
  return(x)
}




