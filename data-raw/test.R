# Generate dummy datasets (.rda files)

test <- system.file("extdata", "test.csv", package="ototools")

test <- read.table(file = test, sep = ";", stringsAsFactors = F)

devtools::use_data(test, overwrite = TRUE)
