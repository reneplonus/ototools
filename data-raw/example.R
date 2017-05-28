# Generate dummy datasets (.rda files)

example <- system.file("extdata", "example.csv", package = "ototools")
example <- read.table(file = example, skip = 1, sep = ";", stringsAsFactors = FALSE)

basic <- system.file("extdata", "gathering.csv", package = "ototools")
basic <- read.table(file = basic, header = TRUE, sep = ";", stringsAsFactors = FALSE)

test <- system.file("extdata", "test.csv", package = "ototools")
test <- read.table(file = test, sep = ";", stringsAsFactors = FALSE)

fish <- c("example", "example")
format <- "csv"
sep <- ";"
temp <- basic[, names(basic) != "age"]
catch_day <- "catch_date"
master_tib <- master_func(fish = fish, format = format, sep = sep,
                basic = temp, catch_day = catch_day, dir = "F:/ototools")

makro_output <- oto_makro(x_coord = example[,3], y_coord = example[,4], fish_no = "example")

devtools::use_data(example,
                   basic,
                   test,
                   master_tib,
                   makro_output,
                   overwrite = TRUE)

rm(list = ls())
