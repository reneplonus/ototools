context("Load in data correct")
dat <- load_fish(fish = "example", format = "csv", sep = ";", dir = "F:/ototools")

testthat::test_that("calculate mastertable correct ", {
  testthat::expect_equal(nrow(dat), nrow(example))
  testthat::expect_equal(ncol(dat), ncol(example))
  testthat::expect_equal(names(dat)[2], names(example)[2])
})
