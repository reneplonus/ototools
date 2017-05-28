#' load_fish
#'
#' Load in the data correctly for oto_makro.
#'
#' Automatically load in the data the way it's needed for oto_makro. Returns a R object.
#'
#' @param fish name of the file to be loaded
#' @param dir path to a folder
#' @param format format of the file to be loaded (either txt or csv, the default is txt)
#' @param sep separator used by the file to be loaded (default is tab)
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- load_fish(fish = "example", format = "csv", sep = ";", dir = "F:/ototools")
#' str(fish)
#'


load_fish <- function(fish, dir = getwd(), format = "txt", sep = "\t") {
    #name of the file to be loaded
    fi <- paste0("/", fish, ".", format)
    #get path to each object in the working directory
    files <- list.files(path = dir, pattern = basename(fish), full.names = TRUE, recursive = TRUE)
    #witch path is the correct one to the files searched for
    mine <- which(grepl(fi, files) == TRUE)
    if (length(mine) != 1) {
      stop(paste0("Make sure each element in fish refers to only 1 file! Check ", fi))
    }
    #load the file
    if(format == "txt") {
      file <- utils::read.table(file = files[mine], skip = 1, stringsAsFactors = FALSE, sep = sep, dec = ",")
    } else {
      file <- utils::read.table(file = files[mine], skip = 1, stringsAsFactors = FALSE, sep = sep)
    }
  return(file)
}
