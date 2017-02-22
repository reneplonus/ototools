# Generate dummy datasets (.rda files)

gathering <- system.file("extdata", "gathering.csv", package="ototools")

gathering <- read.table(file = gathering, header = TRUE, sep = ";", stringsAsFactors = F)

devtools::use_data(gathering, overwrite = TRUE)
