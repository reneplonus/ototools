% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adjust_age.R
\name{adjust_age}
\alias{adjust_age}
\title{adjust_age}
\usage{
adjust_age(x, value = NULL, mean = NULL, sd = NULL, data = NULL,
  names = NULL)
}
\arguments{
\item{x}{an output from \link{oto_makro} to be corrected}

\item{value}{a vector with values tp be added to ring_no}

\item{mean}{a vector with values to be matched with hc}

\item{sd}{a vector indicating the possible error of the values given in mean}

\item{data}{instead of passing value, mean and sd you can simply pass a dfr including all three values.
In that case, names is needed.}

\item{names}{a character vector of length 3 indicating which column in data represents which argument
needed in adjust_rings (value, mean, sd)}
}
\description{
Adjusts the number of rings.
}
\details{
If the counting of rings does not start at the hatch check, this function adjusts the values given by
\link{oto_makro}.
}
\examples{
#rm(list = ls())
x <- makro_output
data <- data.frame(ring_no = c(1:10),
                   mean = sort(seq(from = 5, to = 15, length.out = 10) + runif(10, -1, 1)),
                   sd = runif(10, 0, 2))
names <- c("ring_no", "mean", "sd")
#using data:
adjust_age(x, data = data, names = names)
#without using data:
adjust_age(x, data$ring_no, data$mean, data$sd)

}
