#' load_fish2
#'
#' Load in the data correctly for oto_makro.
#'
#' Automatically load in the data the way it's needed for oto_makro. Returns a R object.
#' Instead loading only one file, load_fish2 can load multiple files for the same individual.
#'
#' @param fish name of the file to be loaded
#' @param section which sections to be loaded. Has to be part of the filename!
#' @param dir path to a folder
#' @param sep separator used by the file to be loaded (default is tab)
#' @export
#'
#' @examples
#' #rm(list = ls())
#'

load_fish2 <- function(fish, section, dir = getwd(), sep = "\t") {
  #name of the file to be loaded
  fi <- paste0("/", fish, "_", section, ".txt")
  #get path to each object in the working directory
  files <- list.files(path = dir, pattern = basename(fish), full.names = TRUE, recursive = TRUE)
  #witch path is the correct one to the files searched for
  mine <- purrr::map2_dbl(fi, list(files), ~which(grepl(.x, .y) == TRUE))
  #load the file
  #create a dummy row to fill in between to sections
  dummy_row <- rep(NA, times = 18)
  file <- purrr::map_df(mine, ~rbind(utils::read.table(file = files[.], skip = 1, stringsAsFactors = FALSE, sep = sep, dec = ","), dummy_row))

  if (length(mine) != 1) {
    message(paste0("The following files have been loaded: \n", files[mine]))
  }
  #skip the last row - is only NA and not needed
  return(file[2:nrow(file) - 1,])
}
