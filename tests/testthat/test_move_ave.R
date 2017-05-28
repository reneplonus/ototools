context("Calculations correct")
dat <- move_ave(master_tib$ring_no[[1]], master_tib$ring_width[[1]])

testthat::test_that("calculate mastertable correct ", {
  testthat::expect_equal(dat[1:4], as.numeric(c(NA, NA, NA, NA)))
  testthat::expect_equal(dat[(length(dat) - 3) : length(dat)], as.numeric(c(NA, NA, NA, NA)))
  testthat::expect_equal(dat[36], master_tib$move_ave[[1]][36])
})
