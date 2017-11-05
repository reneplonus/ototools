context("Calculations correct")
x <- move_ave(dat$ring_no[[1]], dat$ring_width[[1]])

test_that("move_ave", {
  expect_equal(x[1:4], as.numeric(c(NA, NA, NA, NA)))
  expect_equal(x[(length(x) - 3) : length(x)], as.numeric(c(NA, NA, NA, NA)))
  expect_equal(x[36], dat$move_ave[[1]][36])
})
