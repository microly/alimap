#' get_cities_map
#'
#' @param adcode a numeric or a character of length one, the adcode of a province.
#'
#' @return a sf object, the boundary of prefecture cities for a province.
get_cities_map <- function(adcode) {
    url <- paste0("https://geo.datav.aliyun.com/areas/bound/",
                  adcode, "_full.json")
    map <- sf::read_sf(url)
    dplyr::select(map, adcode, name, level)
}


#' get_city_map
#'
#' @param adcode a numeric or a character of length one, the adcode of a
#' province-level municipality or a special administrative region.
#'
#' @return a sf object, the boundary of a province-level municipality or
#' a special administrative region.
get_city_map <- function(adcode) {
    url <- paste0("https://geo.datav.aliyun.com/areas/bound/",
                  adcode, ".json")
    map <- sf::read_sf(url)
    dplyr::select(map, adcode, name, level)
}


#' map_prefecture_city
#'
#' get the map of prefecture cities of China.
#'
#' @return a sf object, the boundary of all the prefecture cities of China.
#' @export
#'
#' @examples
#' map <- map_prefecture_city()
#' plot(map)
map_prefecture_city <- function() {
    adcode_province <- c(130000, 140000, 150000, 210000, 220000, 230000, 320000,
                         330000, 340000, 350000, 360000, 370000, 410000, 420000,
                         430000, 440000, 450000, 460000, 510000, 520000, 530000,
                         540000, 610000, 620000, 630000, 640000, 650000, 710000)
    sf_list_province <- purrr::map(adcode_province, get_cities_map)

    # "beijing: 110000", "tianjin: 120000", "shanghai: 310000", "chongqing: 500000"
    # "xianggang: 810000", "aomen: 820000"
    adcode_city <- c(110000, 120000, 310000, "500000", 810000, 820000)
    sf_list_city <- lapply(adcode_city, get_city_map)

    do.call(rbind, c(sf_list_province, sf_list_city))
}

