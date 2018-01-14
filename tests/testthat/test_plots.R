context("Plots")

# Based:on vdiffr package: https://github.com/lionel-/vdiffr

# Add new reference with vdiffr::validate_cases()
# --> svg-file is created in tests/ffigs/subfolder
# Test tests with vdiffr::validate_cases()
# N = New visual case
# X = Failed doppelganger
# o = Convincing doppelganger

# To test specific files only (otherwise testhat()
# is performed on all tests):
# vdiffr::validate_cases(cases = vdiffr::collect_cases(filter = '_plot'))

# Use the shiny app to identify problems
# vdiffr::manage_cases(filter = '_plot') Toggle:
# Left-klick to switch between new & old version
# Slide: Left-klick + move to identify specific
# differences Diff: Black = match, white = no match

#geom_scalebar
scalebar <- ggplot2::ggplot(data = NULL, ggplot2::aes(x = c(2,5), y = c(3, 1))) +
  ggplot2::geom_point() +
  geom_scalebar(range = c(2.5, 4.5), y = 2, segments = 4, size = 2)

#plot_hatch
values <- basic$deathday - basic$age
hatch <- plot_hatch(values = values)

#plot_geom_point
plot_point <- plot_geom_point(data = basic, x_var = "oto_diameter_mm", y_var = "tl_mm")

#plot_growth
plot_growth <- plot_growth(x_var = dat$julday[[1]], y_var = dat$ring_width[[1]])

#plot_outline
plot_outline <- ggplot2::ggplot(data = NULL, ggplot2::aes(x = 1, y = 1)) +
  ggplot2::geom_point() +
  plot_outline()

test_that("plots", {
  # vdiffr::expect_doppelganger("geom_scalebar", scalebar)
  # vdiffr::expect_doppelganger("plot_hatch", hatch)
  # vdiffr::expect_doppelganger("plot_geom_point", plot_point)
  # vdiffr::expect_doppelganger("plot_growth", plot_growth)
  # vdiffr::expect_doppelganger("plot_outline", plot_outline)
})

# Once changes have been made: -->
# Running testthat to collect visual cases:
# vdiffr::validate_cases(cases = vdiffr::collect_cases(filter = "_plot"))
