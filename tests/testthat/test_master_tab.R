context("Calculations correct")
dat <- master_tab(list(x = makro_output, x = makro_output))

testthat::test_that("calculate mastertable correct ", {
  testthat::expect_equal(nrow(dat), nrow(makro_output) * 2)
  testthat::expect_equal(dat$id[[1]], dat$id[[2]])
})
