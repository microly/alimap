#' map_nation
#'
#' get the national map of China.
#'
#' @return a sf object of the national boundary of China.
#' @export
#'
#' @examples
#' map <- map_nation()
#' plot(map)
map_nation <- function() {
    map <- sf::read_sf("https://geo.datav.aliyun.com/areas/bound/100000.json")
    dplyr::select(map, adcode, name, level)
}


#' map_JDX
#'
#' @return a sf object of Jiu Duan Xian.
#' @export
#'
#' @examples
#' map <- map_JDX()
#' plot(map)
map_JDX <- function() {
    map <- sf::read_sf("https://geo.datav.aliyun.com/areas/bound/100000_full.json")
    map <- dplyr::slice(map, 35)
    dplyr::select(map, adcode, adchar)
}
