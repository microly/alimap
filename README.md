# alimap
A package to supply Chinese maps (sf objects) from aliyun (http://datav.aliyun.com/tools/atlas).

## Installation

``` r
# install.packages("devtools")
devtools::install_github("microly/alimap")
```

## How to get the maps :

```r
# get the national map of China.
map <- map_nation()
plot(map)

# get the provincial map of China.
map <- map_province()
plot(map)

# get the map of prefecture cities of China.
map <- map_prefecture_city()
plot(map)
```
