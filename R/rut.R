#' Calculo digito verificador de RUTs
#' 
#' @param rutnum ruts en formato numerico.
#' 
#' @examples 
#'
#' rutnum <- c(16019432, 16355485, 15724861, 121, 6505922)
#' 
#' rutnum_dv(rutnum)
#' 
#' @importFrom purrr map map_chr
#' @importFrom stringr str_trim str_split 
#' @importFrom dplyr case_when
#' @export
rutnum_dv <- function(rutnum){

  mult <- rep(2:7)
  
  dv <- rutnum %>% 
    format(scientific = F) %>% 
    str_trim() %>% 
    str_split("") %>% 
    map(as.numeric) %>% 
    map(rev) %>% 
    map(function(nm){ nm * rep(mult, length.out = length(nm))}) %>% # nm <- c(2, 3, 4, 9, 1, 0, 6, 1)
    map(sum) %>% 
    map(function(s) { 11 - s%%11 }) %>% 
    map_chr(as.character)
    
  dv <- case_when(
    dv == 10 ~ "K",
    dv == 11 ~ "0",
    TRUE ~ dv
  )
  
  dv
  
}

#' Formatear RUT numerico a RUT con digito verificador
#' 
#' @param rutnum RUT en formato numerico.
#' @param sep Separador.
#' 
#' @examples 
#' 
#' rutnum <- c(16019432, 16355485, 15724861, 121, 6505922)
#' 
#' rutnum_rut(rutnum)
#' 
#' @importFrom stringr str_c
#' @export
rutnum_rut <- function(rutnum, sep = ""){

  str_c(rutnum, rutnum_dv(rutnum), sep = sep)

}


#' Formatear RUT con digito verificador a RUT de largo 10
#' 
#' @param rut RUT con digito verificador.
#' 
#' @examples
#' 
#' ruts <-  rutnum_rut(c(16019432, 16355485, 15724861, 121, 6505922))
#' 
#' ruts
#' 
#' rut_rut10(ruts)
#' 
#' @importFrom stringr str_to_upper str_replace_all str_pad
#' @export
rut_rut10 <- function(rut) {

  rut10 <- rut %>%
    str_trim() %>%
    str_to_upper() %>%
    str_replace_all("-", "") %>%
    str_pad(width = 10, pad = "0", side = "left")

  rut10

}

#' Formatear un RUT de largo 10 a RUT numerico
#' 
#' @param rut10 RUT con digito verificador de largo 10.
#' 
#' r10 <- rut_rut10(rutnum_rut(c(16019432, 16355485, 15724861, 121, 6505922)))
#' 
#' r10
#' 
#' rut10_rutnum(r10)
#' 
#' @importFrom stringr str_sub
#' @export
rut10_rutnum <- function(rut10){

  rutnum <- rut10 %>%
    str_sub(end = -2) %>%
    as.numeric()

  rutnum
}

#' Formatear una cadena de texto o numero en formato RUT
#' 
#' @param rut RUT con o sin digito verificador, con o sin guion y/o puntos.
#' 
#' ruttexto_rutnum("16.019.432")
#'  
#' @export
as_rut <- function(rut){
  
  rutnum <- rut %>%
    str_trim() %>% 
    str_replace_all(pattern = "\\.|-|[a-z]|[A-Z]", replacement = "") 
  
  if (nchar(rutnum) < 9) {
    dv <- rutnum_dv(rutnum)
    
    if (str_sub(rutnum, start = -1, end = -1) != dv) rutnum <- str_c(rutnum, dv)
  }  
  
  rutnum
}