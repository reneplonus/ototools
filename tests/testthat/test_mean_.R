context("Test mean_")
sd_test <- 1.96
test <- mean_(dat$ring_width, dat$julday, sd = sd_test)
test_na <- mean_(c(1, 2, 3, NA))
test_na2 <- mean_(c(1, 2, 3, NA), na.rm = TRUE)
test_group <- mean_(dat$ring_width[[1]], dat$ring_no[[1]])
test_vector <- mean_(dat$ring_width[[1]])
#test mean
#select a day every individual has
julday <- max(purrr::map_dbl(dat$julday, min)) + 1
#get values for that day
rw <- purrr::map2_dbl(dat$ring_width, dat$julday, ~.x[.y == julday])

test_that("mean_", {
  #test basic
  expect_true(ncol(test) == 3)
  expect_equal(test$sd_x_1.96[test$group == julday], sd(rw) * sd_test)
  expect_equal(test$mean[test$group == julday], mean(rw))
  expect_true(all(test$group == seq(from = min(test$group), to = max(test$group))))
  #test NA
  expect_true(ncol(test_na) == 1)
  expect_true(ncol(test_na2) == 1)
  expect_equal(test_na$mean, as.numeric(NA))
  expect_equal(test_na2$mean, 2)
  #test group
  expect_true(ncol(test_group) == 2)
  expect_equal(nrow(test_group), length(dat$ring_no[[1]]))
  expect_equal(test_group$mean, dat$ring_width[[1]])
  #test vector
  expect_true(ncol(test_vector) == 1)
  expect_equal(test_vector$mean, mean(dat$ring_width[[1]]))
})
