context("Calculations correct")

testthat::test_that("calculate correct ring width", {
  testthat::expect_equal(oto_makro(x = example[,3], y = example[,4], fish_no = 41)[[1]][, "ring_width"], test$V2)
})
