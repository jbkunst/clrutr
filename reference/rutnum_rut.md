# Formatear RUT numerico a RUT con digito verificador

Formatear RUT numerico a RUT con digito verificador

## Usage

``` r
rutnum_rut(rutnum, sep = "")
```

## Arguments

- rutnum:

  RUT en formato numerico.

- sep:

  Separador.

## Examples

``` r

rutnum <- c(16019432, 16355485, 15724861, 121, 6505922)

rutnum_rut(rutnum)
#> [1] "160194324" "163554852" "157248618" "121K"      "65059223" 
```
