context("Calculations correct")
fish <- c("708", "708")
format <- "csv"
sep <- ";"
test <- basic[, names(basic) != "age"]
catch_day <- "catchday"
x <- master_func(fish = fish, format = format, sep = sep,
                 basic = test, catch_day = catch_day, dir = substr(getwd(), 1, 11))

test_that("test master_func", {
  expect_equal(ncol(x), ncol(dat))
  expect_equal(names(x), names(dat))
  expect_equal(purrr::map_chr(x, ~class(.x)), purrr::map_chr(dat, ~class(.x)))
})
