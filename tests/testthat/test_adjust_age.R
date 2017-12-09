context("Calculations correct")
x <- makro_output
#generated randomly once
# a <- sort(seq(from = 5, to = 15, length.out = 10) + runif(10, -1, 1))
# b <- runif(10, 0, 2)
a <- c(4.787283, 6.447875, 7.637744, 8.633590, 9.826411, 10.253712, 11.032269, 12.331923, 13.345387, 14.761222)
b <- c(1.9648557, 1.1850090, 1.7615487, 1.1492736, 1.3776724, 0.2618423, 0.6018208, 0.6164486, 0.3997028, 0.7165491)

data <- data.frame(ring_no = c(1:10),
                   mean = a,
                   sd = b)
names <- c("ring_no", "mean", "sd")
#using data:
test1 <- adjust_age(x, data = data, names = names)
#without using data:
test2 <- adjust_age(x, data$ring_no, data$mean, data$sd)

#test warning
data2 <- data
data2$ring_no <- round(seq(from = 50, to = 150, length.out = 10), digits = 0)
data2$sd <- 2

#manually:
hc <- x$hc                                                                        #hc
match <- max(which(a < hc))                                                       #position of greatest mean < hc
a_match <- a[match]                                                               #has to be < hc
a_match2 <- a[match + 1]                                                          #has to be > hc
sd_value <- mean(c(data$ring_no[max(which(a < (a[match] + b[match])))] - match,   #mean + sd
                   match - data$ring_no[max(which(a < (a[match] - b[match])))]))  #mean - sd
sd_value <- round(sd_value, digits = 0)
new_age <- x$age + data$ring_no[match]

test_that("test adjust_age", {
  expect_equal(test1$age, new_age)
  expect_equal(test2$hc, as.numeric(NA))
  expect_equal(x$ring_no[[1]] + match, test1$ring_no[[1]])
  expect_true(a_match < hc)
  expect_true(a_match2 > hc)
  expect_warning(adjust_age(x = x, data = data2, names = names))
})
