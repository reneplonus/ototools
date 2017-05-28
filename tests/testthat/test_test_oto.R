context("Calculations correct")
data <- test_oto(fish = "example", format = "csv", sep = ";", dir = "F:/ototools")

testthat::test_that("calculate mastertable correct ", {
  testthat::expect_equal(data$age, test$V5[1])
  testthat::expect_equal(data$hc, test$V3[1])
  testthat::expect_equal(data$ring_width[[1]], test$V2)
  testthat::expect_equal(data$oto_rad, test$V4[1])
})
