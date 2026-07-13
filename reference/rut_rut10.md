# Formatear RUT con digito verificador a RUT de largo 10

Formatear RUT con digito verificador a RUT de largo 10

## Usage

``` r
rut_rut10(rut)
```

## Arguments

- rut:

  RUT con digito verificador.

## Examples

``` r

ruts <-  rutnum_rut(c(16019432, 16355485, 15724861, 121, 6505922))

ruts
#> [1] "160194324" "163554852" "157248618" "121K"      "65059223" 

rut_rut10(ruts)
#> [1] "0160194324" "0163554852" "0157248618" "000000121K" "0065059223"
```
