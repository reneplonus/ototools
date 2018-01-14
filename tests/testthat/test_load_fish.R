context("Load in data correct")
x <- load_fish(fish = "708", format = "csv", sep = ";", dir = substr(getwd(), 1, 11))

test_that("load_fish", {
  expect_equal(nrow(x), nrow(example))
  expect_equal(ncol(x), ncol(example))
  expect_equal(names(x)[2], names(example)[2])
})
