# Generate dummy datasets (.rda files)

example <- system.file("extdata", "708.csv", package = "ototools")
example <- read.table(example, sep = ";", stringsAsFactors = FALSE, skip = 1)

test <- system.file("extdata", "test.csv", package = "ototools")
test <- read.table(file = test, sep = ";", stringsAsFactors = FALSE)

makro_output <- oto_makro(x_coord = example[,3], y_coord = example[,4], fish_no = "example")
makro_output$id <- "708"

basic <- system.file("extdata", "summary.csv", package = "ototools")
basic <- read.table(file = basic, sep = ";", stringsAsFactors = FALSE, header = TRUE)
names(basic) <- tolower(names(basic))
basic$id <- as.character(basic$id)

# dat <- system.file("extdata", "dat.rds", package = "ototools")
# load(file = dat)
dat <- master_func(basic$id, basic = basic[,names(basic) != "age"], catch_day = "catchday", dir = "F:/Masterarbeit/Dorsch_Rene")

devtools::use_data(basic,
                   example,
                   test,
                   makro_output,
                   dat,
                   overwrite = TRUE)

rm(list = ls())
