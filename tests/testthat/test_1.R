context("Calculations correct")
data <- oto_makro(x = example[,3], y = example[,4], fish_no = 41)

testthat::test_that("calculate mastertable correct ", {
  testthat::expect_equal(data$age, test$V5[1])
  testthat::expect_equal(data$hc, test$V3[1])
  testthat::expect_equal(data$ring_width[[1]], test$V2)
  testthat::expect_equal(data$oto_rad, test$V4[1])
})
