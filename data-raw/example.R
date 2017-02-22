# Generate dummy datasets (.rda files)

example <- system.file("extdata", "example.csv", package="ototools")

example <- read.table(file = example, skip = 1, sep = ";", stringsAsFactors = F)

devtools::use_data(example, overwrite = TRUE)
