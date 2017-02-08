
<!-- README.md is generated from README.Rmd. Please edit that file -->
`clrutr`
========

Funciones para validación y formateo de Rol Unico Tributario Chileno.

Instalación
-----------

``` r
source("https://install-github.me/r-latinoamerica/idlatr")
```

Funciones
---------

``` r
library(clrutr)
rutnum <- c(16019432, 16355485, 15724861, 121, 6505922)

rutnum_dv(rutnum)
#> [1] "4" "2" "8" "K" "3"

rutnum_rut(rutnum, sep = "-")
#> [1] "16019432-4" "16355485-2" "15724861-8" "121-K"      "6505922-3"
rut <- rutnum_rut(rutnum)
rut
#> [1] "160194324" "163554852" "157248618" "121K"      "65059223"


rut10 <- rut_rut10(rut)
rut10
#> [1] "0160194324" "0163554852" "0157248618" "000000121K" "0065059223"

rut10_rutnum(rut10)
#> [1] 16019432 16355485 15724861      121  6505922
```
