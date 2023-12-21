## fonction permettant de trouver les longitudes et latitudes
## d'un vecteur contenant plusieurs adresses

#####  Exemple d'utilisation pour trouver les coordonnees geographiques de 4 adresses
# MesAdresses <- c("4 place Jussieu Paris","école Polytechnique, Palaiseau", "35000 France","Rennes")
# geocodeGratuit(MesAdresses)


if (!(require(jsonlite))) install.packages("jsonlite")
geocodeGratuit <- function(adresses){
# adresses est un vecteur contenant toutes les adresses sous forme de chaine de caracteres
  nominatim_osm <- function(address = NULL){
    ## details: http://wiki.openstreetmap.org/wiki/Nominatim
    ## fonction nominatim_osm proposée par D.Kisler
    if(suppressWarnings(is.null(address)))  return(data.frame())
    tryCatch(
      d <- jsonlite::fromJSON(
        gsub('\\@addr\\@', gsub('\\s+', '\\%20', address),
             'http://nominatim.openstreetmap.org/search?q=@addr@&format=json&addressdetails=0&limit=1')
      ), error = function(c) return(data.frame())
    )
    if(length(d) == 0) return(data.frame())
    return(c(as.numeric(d$lon), as.numeric(d$lat)))
  }
  tableau <- t(sapply(adresses,nominatim_osm))
  colnames(tableau) <- c("lon","lat")
  return(tableau)
}


