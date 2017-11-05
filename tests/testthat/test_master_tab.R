context("Calculations correct")
dat <- master_tab(list(x = makro_output, x = makro_output))

test_that("master_tab", {
  expect_equal(nrow(dat), nrow(makro_output) * 2)
  expect_equal(dat$id[[1]], dat$id[[2]])
  expect_error(master_tab(list(makro_output, makro_output[,1:(ncol(makro_output) - 1)])))
})
