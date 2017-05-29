context("Load in data correct")

dat <- calc_mean_growth(master_tib$julday, master_tib$ring_width)

testthat::test_that("calculate mastertable correct ", {
  testthat::expect_equal(dat$sd_growth[1], 0)
  testthat::expect_equal(dat$mean_growth[5], master_tib$ring_width[[1]][5])
  testthat::expect_equal(dat$julday[1], min(unlist(master_tib$julday)))
  testthat::expect_equal(dat$julday, unique(unlist(master_tib$julday)))
})
