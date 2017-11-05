# Generate dummy datasets (.rda files)

example <- system.file("extdata", "708.csv", package = "ototools")
example <- read.table(example, sep = ";", stringsAsFactors = FALSE, skip = 1)

test <- system.file("extdata", "test.csv", package = "ototools")
test <- read.table(file = test, sep = ";", stringsAsFactors = FALSE)

makro_output <- oto_makro(x_coord = example[,3], y_coord = example[,4], fish_no = "example")
makro_output$id <- "708"

dat <- system.file("extdata", "dat.rds", package = "ototools")
load(file = dat)

basic <- system.file("extdata", "basic.rds", package = "ototools")
load(file = basic)

dat_ro <- system.file("extdata", "dat_ro.rds", package = "ototools")
load(file = dat_ro)

# fish <- c("708", "708")
# format <- "csv"
# sep <- ";"
# temp <- basic[, names(basic) != "age"]
# catch_day <- "deathday"
# master_tib <- master_func(fish = fish, format = format, sep = sep,
#                           basic = temp, catch_day = catch_day, dir = "F:/ototools")

devtools::use_data(basic,
                   example,
                   test,
                   # master_tib,
                   makro_output,
                   dat,
                   dat_ro,
                   overwrite = TRUE)

rm(list = ls())
