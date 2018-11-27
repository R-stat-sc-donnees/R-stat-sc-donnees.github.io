## fonction geocoding utilisant OSM Nominatim API
## details: http://wiki.openstreetmap.org/wiki/Nominatim
## fonction nominatim_osm proposée par D.Kisler

if (!(require(jsonlite))) install.packages("jsonlite")
geocodeGratuit <- function(adresses){
# adresses est un vecteur contenant toutes les adresses sous forme de chaine de caracteres
  nominatim_osm <- function(address = NULL){
    if(suppressWarnings(is.null(address)))  return(data.frame())
    tryCatch(
      d <- jsonlite::fromJSON(
        gsub('\\@addr\\@', gsub('\\s+', '\\%20', address),
             'http://nominatim.openstreetmap.org/search/@addr@?format=json&addressdetails=0&limit=1')
      ), error = function(c) return(data.frame())
    )
    if(length(d) == 0) return(data.frame())
    return(data.frame(lon = as.numeric(d$lon), lat = as.numeric(d$lat))) 
  }
  return(t(sapply(adresses,nominatim_osm)))
}

#####  Exemple : trouver les coordonnées géographiques de 4 adresses
# MesAdresses <- c("Jussieu, Paris", "Ecole polytechnique, Palaiseau","35000 France","Rennes")
# geocodeGratuit(MesAdresses)

