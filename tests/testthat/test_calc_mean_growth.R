context("Load in data correct")

test <- calc_mean_growth(dat$julday, dat$ring_width)

#test mean
julday <- max(purrr::map_dbl(dat$julday, min)) + 1
rw <- purrr::map2_dbl(dat$ring_width, dat$julday, ~.x[.y == julday])

test_that("calculate mastertable correct ", {
  #test sd
  expect_equal(test$sd_growth[test$julday == julday], sd(rw))
  #test mean
  expect_equal(test$mean_growth[test$julday == julday], mean(rw))
  #test julday
  expect_true(all(test$julday == seq(from = min(test$julday), to = max(test$julday))))
})
