context("Calculations correct")
data <- oto_makro(x = example[,3], y = example[,4], fish_no = 41)

test_that("oto_makro", {
  expect_equal(data$age, test$V5[1])
  expect_equal(data$hc, test$V3[1])
  expect_equal(data$ring_width[[1]], test$V2)
  expect_equal(data$oto_rad, test$V4[1])
  expect_lt(sum(data$hc, data$ring_width[[1]]), data$oto_rad)
})
