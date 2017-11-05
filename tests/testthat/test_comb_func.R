context("Calculations correct")
x <- oto_makro(x = example[,3], y = example[,4], fish_no = "708")
y <- basic
error <- y
y$age <- as.numeric(y$age)
combi <- comb_func(x = x, y = y, by = c("id", "age"))


test_that("comb_func", {
  expect_equal(nrow(x), nrow(combi))
  expect_error(comb_func(x = x, y = error, by = c("id", "age")))
  expect_equal(ncol(x) + ncol(y) - 2, ncol(combi))
  expect_equal(names(combi), unique(c(names(x), names(y))))
  expect_equal(purrr::map_chr(combi, ~class(.x))[1:4], purrr::map_chr(x, ~class(.x))[1:4])
})
