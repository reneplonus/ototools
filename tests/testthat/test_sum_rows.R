context("Calculations correct")
data <- sum_rows(dat$ring_width[[1]])

test_that("test sum_rows", {
  expect_equal(data[30], sum(dat$ring_width[[1]][1:30]))
})
