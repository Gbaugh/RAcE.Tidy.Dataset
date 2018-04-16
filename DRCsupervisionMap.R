#   Supervision Map of RAcE Project in Tanganzika, DRC
#
#
#
#
#
#
#
library(readxl)
library(ggrepel)
library(ggplot2)
library(ggmap)
library(viridis)
library(maps)
library(rgdal)
library(
)




# The ggmap function 'geocode'  will get the Latitude and Longitude of the location 
# e.g. getRACEcoords <- geocode('BIGOBO, Tanganyika, DRC')



DRCzones <- read_excel("D:/WHO RAcE 2015/Datasets/DRC/GIS/Coord_Aires.xlsx", sheet="Zones", col_names = TRUE)
DRCzones <- data.frame(DRCzones)
map <- get_map(location = c(c(left = 25.4, bottom = -8.5, right = 31, top = -4.800890838853971)),  maptype = "terrain")
ggmap(map)   +geom_point(data=DRCzones, aes(x=Lat, y=Long, size = 1, alpha = 0.7)) + geom_text_repel(data = DRCzones, aes(x=Lat, y=Long, label = DRCzones$Zone.de.Santé), cex = 3, alpha = 0.7)+ theme(legend.position="none") + labs(x=NULL, y=NULL, title="Bureaux Centraux des Zones de Santé, RAcE Project, Tanganyika, DRC")


DRCaires <- read_excel("D:/WHO RAcE 2015/Datasets/DRC/GIS/Coord_Aires.xlsx", sheet="Aires", col_names = TRUE)
DRCaires <- data.frame(DRCaires)
map <- get_map(location = c(c(left = 25.3, bottom = -8.5, right = 31, top = -4.8)),  maptype = "terrain")
# HEATMAP: ggmap(map)   + geom_density2d(data = DRCaires, aes(x=Lat, y=Long), size = 0.3) + stat_density2d(data = DRCaires, aes(x=Lat, y=Long, fill = ..level.., alpha = ..level..), size = 0.01, bins = 16, geom = "polygon") + scale_fill_viridis() + scale_fill_gradient(low = "green", high = "red") + scale_alpha(range = c(0, 0.3), guide = FALSE) +geom_point(data=DRCaires, aes(x=Lat, y=Long, color = Distance.de.BCZ.à.CS, size = Nombre.de.sites), , alpha = 0.6) + labs(x = 'Longitude', y = 'Latitude')+ geom_text_repel(data = DRCaires, aes(x=Lat, y=Long, label = Nombre.de.sites), cex = 3, segment.color = "grey", alpha = 0.7, segment.size = .1) + labs(x=NULL, y=NULL, title="Map of Supervising Aires de Santé, RAcE Project, Tanganyika, DRC", color = "Dx to BCZS\n", size = "No. of SSC Under Supervision\n")
ggmap(map)  + geom_point(data=DRCaires, aes(x=Lat, y=Long, color = Distance.de.BCZ.à.CS, size = Nombre.de.sites), alpha = 0.6) + labs(x = 'Longitude', y = 'Latitude')+ geom_text_repel(data = DRCaires, aes(x=Lat, y=Long, label = Nombre.de.sites), cex = 3, segment.color = "grey", alpha = 0.7, segment.size = .1) + labs(x=NULL, y=NULL, title="Aires de Santé, RAcE Project, Tanganyika, DRC", color = "Dx to BCZS\n", size = "No. of SSC Under Supervision\n")






