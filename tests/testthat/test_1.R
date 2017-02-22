context("Calculations correct")

testthat::test_that("calculate mastertable correct ", {
  testthat::expect_equal(oto_makro(x = example[,3], y = example[,4], fish_no = 41)[1, "age"], test$V5[1])
  testthat::expect_equal(oto_makro(x = example[,3], y = example[,4], fish_no = 41)[1, "hc"], test$V3[1])
  testthat::expect_equal(oto_makro(x = example[,3], y = example[,4], fish_no = 41)[, "ring_width"], test$V2)
  testthat::expect_equal(oto_makro(x = example[,3], y = example[,4], fish_no = 41)[1, "oto_rad"], test$V4[1])
})
