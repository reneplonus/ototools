context("Calculations correct")
data <- test_oto(fish = "708", format = "csv", sep = ";", dir = "F:/ototools")

test_that("test oto", {
  expect_equal(data$age, test$V5[1])
  expect_equal(data$hc, test$V3[1])
  expect_equal(data$ring_width[[1]], test$V2)
  expect_equal(data$oto_rad, test$V4[1])
})
