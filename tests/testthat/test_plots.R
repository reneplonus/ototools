context("Test plot functions")

# Based:on vdiffr package: https://github.com/lionel-/vdiffr

# Add new reference with vdiffr::validate_cases()
# --> svg-file is created in tests/ffigs/subfolder
# Test tests with vdiffr::validate_cases()
# N = New visual case
# X = Failed doppelganger
# o = Convincing doppelganger

# To test specific files only (otherwise testhat()
# is performed on all tests):
# vdiffr::validate_cases(cases =
# vdiffr::collect_cases(filter = '_plot'))

# Use the shiny app to identify problems
# vdiffr::manage_cases(filter = '_plot') Toggle:
# Left-klick to switch between new & old version
# Slide: Left-klick + move to identify specific
# differences Diff: Black = match, white = no match

scalebar <- ggplot2::ggplot(data = NULL, ggplot2::aes(x = c(2,5), y = c(3, 1))) +
  ggplot2::geom_point() +
  geom_scalebar(range = c(2.5, 4.5), y = 2, segments = 4, size = 2)

test_that("plot_trend", {
  vdiffr::expect_doppelganger("plot scalebar", scalebar)
})

# Once changes have been made: -->
# Running testthat to collect visual cases:
# vdiffr::validate_cases(cases = vdiffr::collect_cases(filter = "_plot"))
