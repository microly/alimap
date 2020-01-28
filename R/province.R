#' map_province
#'
#' get the provincial map of China.
#'
#' @return a sf object of the provincial boundary of China.
#' @export
#'
#' @examples
#' map <- map_province()
#' plot(map)
map_province <- function() {
    map <- sf::read_sf("https://geo.datav.aliyun.com/areas/bound/100000_full.json")
    dplyr::select(map, adcode, name, level)
}
