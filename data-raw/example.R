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

devtools::use_data(example, gathering, test, master_tib, overwrite = TRUE)

rm(list = ls())
