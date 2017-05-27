#' test data

#' @format Dummy data:
#' \describe{
#' \item{x pos}{x position}
#' \item{y pos}{y position}
#' }
"test"

#' dummy data

#' @format Dummy data:
#' \describe{
#' \item{x pos}{x position}
#' \item{y pos}{y position}
#' }
"example"

#' gathering

#' @format baisc data:
#' \describe{
#' \item{origin}{where the otolith was sampled}
#' \item{id}{fish id}
#' \item{catchdate}{when was he otolith sampled}
#' \item{tl}{total length}
#' \item{sl}{standard length}
#' \item{wet}{wet weight}
#' \item{dry_total}{dry weight fish + dish}
#' \item{dry_dish}{weight dish}
#' \item{dry_fish}{dry weight fish}
#' \item{oto}{first or second otolith?}
#' \item{oto_wei}{otolith weight}
#' \item{oto_dia}{otolith diameter}
#' \item{foto}{have fotos been made?}
#' \item{age}{estimated age of the fish}
#' \item{quality}{which quality had the fotos?}
#' }
"gathering"



#' master_tib
#'
#' output from master_func()
#'
#' @format A data frame with 2 rows and 21 variables:
#' \describe{
#'   \item{\code{id}}{character. Fish ID.}
#'   \item{\code{ring_no}}{list. Number of daily rings.}
#'   \item{\code{ring_width}}{list. Width of daily rings.}
#'   \item{\code{hc}}{double. Width of the hatch check.}
#'   \item{\code{oto_rad}}{double. Sum of all ring_width and hc.}
#'   \item{\code{age}}{double. Estimated age of the fish.}
#'   \item{\code{origin}}{character. Cruise and date.}
#'   \item{\code{catch_date}}{integer. Date of the catch.}
#'   \item{\code{tl_mm}}{double. TL of the fish in mm.}
#'   \item{\code{sl_mm}}{integer. SL of the fish in mm.}
#'   \item{\code{wet_weight_g}}{double. Wet weight of the fish in g.}
#'   \item{\code{dry_weight_total}}{double. Weight of dried fish and thedish in g.}
#'   \item{\code{weight_dish}}{double. Weight of the dish in g.}
#'   \item{\code{dry_weight_g}}{double. Dry weight of the fish in g.}
#'   \item{\code{oto_1_2}}{integer. First or second otolith.}
#'   \item{\code{oto_weight_mg}}{double. Weight of the otolith in mg.}
#'   \item{\code{oto_diameter}}{double. Diameter of the otolith in µm.}
#'   \item{\code{foto}}{character. Fotos of the otolith avaible? YES (y) or NO (n).}
#'   \item{\code{quality}}{integer. Quality of each foto sequence.}
#'   \item{\code{julday}}{list. Julian day a ring was formed.}
#'   \item{\code{move_ave}}{list. See Huessy 2003.}
#' }
"master_tib"
