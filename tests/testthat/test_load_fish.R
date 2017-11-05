context("Load in data correct")
x <- load_fish(fish = "708", format = "csv", sep = ";", dir = "F:/ototools")

test_that("calculate mastertable correct ", {
  expect_equal(nrow(x), nrow(example))
  expect_equal(ncol(x), ncol(example))
  expect_equal(names(x)[2], names(example)[2])
})
