#' Fish growth
#'
#' Plotting ring width ~ julday on default
#'
#' Plots ring width ~ julian day, should not include more than 12 fish if id is TRUE.
#' Can be used to create other geom_line plots. Returns the plot.
#'
#' @param data a dfr holding both x_var and y_var
#' @param x_var x variable for a geom_line plot
#' @param y_var y variable for a geom_line plot
#' @param id if id is TRUE one plot for each id will be produced,
#'           if not plot_growth will only return one plot
#' @export
#'
#' @examples
#' #rm(list = ls())
#' fish <- "example"
#' format <- "csv"
#' data <- master_func(fish = fish, format = format, sep = ";",
#'                     basic = gathering, catch_day = "catch_date")
#' plot_growth(data = data)
#'

plot_growth <- function(data, x_var = "julday", y_var = "ring_width", id = TRUE) {
  p <- ggplot2::ggplot(data = data, ggplot2::aes_(x = lazyeval::interp(~var, var = as.name(y_var)), lazyeval::interp(~var, var = as.name(y_var)))) +
    ggplot2::geom_line() +
    plot_outline()
  if(id) {
    if(!any(names(data) == "id")) stop("Argument id is missing. plot_growth can only work if data has a column named just id!")
    p + ggplot2::facet_wrap(~id)
}
  return(p)
}
