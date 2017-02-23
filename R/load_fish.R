#' Finding function
#'
#' Loads the data correctly for oto_makro
#'
#' Automatically load in the data the way it's needed for oto_makro. Returns a R object.
#'
#' @param fish name of the file to be loaded
#' @param format format of the file to be loaded (either txt or csv, the default is txt)
#' @param sep separator used by the file to be loaded (default is ";")
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- "example"
#' format <- "csv"
#' fish <- load_fish(fish = fish, format = format)
#' str(fish)
#'

load_fish <- function(fish, format = "txt", sep = ";") {
  #save the current working directory
  init <- getwd()
  #name of the file to be loaded
  fi <- paste0(fish, ".", format)
  #get path to each object in the working directory
  temp <- list.files(full.names = TRUE, recursive = TRUE)
  #get the complete path
  files <- paste0(getwd(), substr(temp, start = 2, stop = max(nchar(temp))))
  #with path is the correct one to the files searched for
  mine <- which(grepl(fi, files) == TRUE)
  #change working directory to the searched file
  setwd(substr(files[mine], start = 1, stop = nchar(files[mine]) - nchar(fi) - 1))
  #load the file
  file <- utils::read.table(file = fi, skip = 1, stringsAsFactors = FALSE, sep = sep)
  #set the working directory back to were it was at the beginning
  setwd(init)

  return(file)
}
